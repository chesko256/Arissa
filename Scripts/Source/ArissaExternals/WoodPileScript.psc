Scriptname WoodPileScript extends ObjectReference  

{script for wood pile - to allow NPCs to pick up and drop wood }

MiscObject Property Firewood Auto  
{what they pick up and drop }

int Property FirewoodCount = 3 Auto
{how many to pick up and drop}

Event OnLoad()
	; clear everything
	gotoState("normal")
endEvent

auto STATE normal
Event OnActivate(ObjectReference akActionRef)
	gotoState("busy")
; 	debug.trace(self + "OnActivate by " + akActionRef)
	RegisterForAnimationEvent(akActionRef, "AddToInventory")
	RegisterForAnimationEvent(akActionRef, "RemoveFromInventory")
	; possibly obsolete?
;	RegisterForAnimationEvent(akActionRef, "IdleFurnitureExit")
endEvent
endState

STATE busy
	; waiting for animation event
endState

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
	if asEventName == "AddToInventory"
		; add only if we need more
		while akSource.GetItemCount(Firewood) < FirewoodCount
			akSource.AddItem(Firewood, 1)
		endWhile
		gotoState("normal")
		UnregisterForEvents(akSource)
	elseif asEventName == "RemoveFromInventory"
		akSource.RemoveItem(Firewood, FirewoodCount )
		gotoState("normal")
		UnregisterForEvents(akSource)
	endif
endEvent

function UnregisterForEvents(ObjectReference akSource)
	; centralize this
	UnRegisterForAnimationEvent(akSource, "AddToInventory")
	UnRegisterForAnimationEvent(akSource, "RemoveFromInventory")
;	UnRegisterForAnimationEvent(akSource, "IdleFurnitureExit")
endFunction
