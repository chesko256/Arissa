Scriptname WoodChoppingScript extends ObjectReference  
{script for wood chopping block
This may be able to be folded into a more generic
crafting script if we find other similar activators
}

Weapon Property Axe Auto  
{required for player to use}

Message Property FailureMessage Auto  
{Message to say why you can't use this
}

MiscObject Property Firewood Auto  
{what you get from chopping
}

Event OnLoad()
	BlockActivation(true)
endEvent

Event OnUnload()
	; safety measure
	UnregisterForEvents()
endEvent

auto STATE normal
Event OnActivate(ObjectReference akActionRef)
	gotoState("busy")
; 	debug.trace(self + "OnActivate")
	if akActionRef == Game.GetPlayer()
		; check if player has axe
		if Game.GetPlayer().GetItemCount(Axe) > 0
			RegisterForEvents()
; ;			debug.trace(self + "player activation START")
			Activate(akActionRef, true)
; ;			debug.trace(self + "player activation END")
		else
			FailureMessage.Show()
		endif
	else
; ;		debug.trace(self + "NPC activation START")
		; just activate it
		Activate(akActionRef, true)
; ;		debug.trace(self + "NPC activation END")
	endif
	gotoState("normal")
endEvent
endState

STATE busy
	; do nothing
endState

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
	if asEventName == "AddToInventory"
		Game.GetPlayer().AddItem(Firewood, 2)
	elseif asEventName == "IdleFurnitureExit"
		UnregisterForEvents()
	endif
endEvent

bool isRegisteredForEvents = false

function RegisterForEvents()
	; centralize this
	isRegisteredForEvents = true
	RegisterForAnimationEvent(Game.GetPlayer(), "AddToInventory")
	RegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
endFunction

function UnregisterForEvents()
	; centralize this
	
	; It is perfectly safe to unregister for events you never registered for, however
	; this function is called as part of OnUnload, and if this object isn't persistent
	; then it may be deleted by the time OnUnload runs, and these function calls will
	; fail. Since RegisterForAnimationEvent persists us, we know it will be safe to
	; call Unregister if we've previously Registered, even if called as a part of
	; OnUnload
	if isRegisteredForEvents
		isRegisteredForEvents = false
		UnRegisterForAnimationEvent(Game.GetPlayer(), "AddToInventory")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
	endif
endFunction