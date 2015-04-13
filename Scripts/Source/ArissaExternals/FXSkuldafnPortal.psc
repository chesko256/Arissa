Scriptname FXSkuldafnPortal extends ObjectReference  
{This script controls the fx and sequences for the portal to sovnegard}

;Stormy weather for when portal is open
;Weather property WeatherForm auto
;local ref name for light to go with fx
ObjectReference Property myLight auto 
ObjectReference Property QSTSovengardePortalOpenRef auto 
ObjectReference Property QSTSovengardePortalOn2DLPMREF auto 
ObjectReference Property QSTSovengardePortalFarLPMREF auto 
ObjectReference Property QSTSovengardePortalOnMonoLPMREF auto 
Sound Property QSTSovengardePortalCloseSDREF auto
int soundInstance01

bool property isOpen = true	auto conditional
{set to true to start open}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	soundInstance01 = QSTSovengardePortalCloseSDREF.play(Seal) 
endEvent

Event OnLoad()
	OpenPortal(NONE, isOpen, true)
endEvent

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
		; switch open state when activated
		OpenPortal(triggerRef, !isOpen)
	endEVENT
endState

; waiting for seal to be ready
state busy
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
	if asEventName == "Done" && akSource == Seal
		UnRegisterForAnimationEvent(akSource, "Done")
		ClosePortal()
	endif
endEvent

endState


function OpenPortal(ObjectReference triggerRef, bool abOpen = true, bool abQuickOpen = false)
	; if busy, wait to finish
	while getState() == "busy"
; 		debug.trace(self + "OpenPortal- BUSY - wait 1 second")
		utility.wait(1)
	endWhile	

	gotoState("busy")
	if abOpen && (!isOpen || abQuickOpen)
; 		debug.trace(self + " opening portal...")
		; enable staff and remove from player's inventory
		myStaff.Enable()
		if triggerRef == Game.GetPlayer()
			Game.GetPlayer().RemoveItem(MQ303DragonPriestStaff)
		endif
		;Play opening sounds
		QSTSovengardePortalOpenRef.enable()
		utility.wait(1)
		QSTSovengardePortalOn2DLPMREF.enable()
		QSTSovengardePortalFarLPMREF.enable()
		QSTSovengardePortalOnMonoLPMREF.enable()
		; set portal to be open
		self.PlayAnimation("PlayAnim02")
		; set seal to be open
		if abQuickOpen
			seal.PlayAnimation("StartOpen")
		else
			seal.PlayAnimation("Open")
		endif
		;turnLight for fx on
		myLight.enable()
		;start stormy weather
;		WeatherForm.SetActive(true)
		myDoor.enable()
		isOpen = true
; 		debug.trace(self + " opening portal DONE")
		goToState("waiting")
	elseif !abOpen && isOpen
; 		debug.trace(self + " closing portal...")
		myStaff.Disable()
		if triggerRef == Game.GetPlayer()
			Game.GetPlayer().AddItem(MQ303DragonPriestStaff)
		endif
		; wait for seal to be ready
		RegisterForAnimationEvent(Seal, "done")
	elseif !abOpen && !isOpen &&  abQuickOpen
; 		debug.trace(self + " activated by onLoad while closed...")
		goToState("Waiting")
	endif

endFunction


; call this when seal is ready
function ClosePortal()
	;Stop opening sounds
	soundInstance01 = QSTSovengardePortalCloseSDREF.play(Seal) 
	QSTSovengardePortalOpenRef.disable()
	QSTSovengardePortalOn2DLPMREF.disable()
	QSTSovengardePortalFarLPMREF.disable()
	QSTSovengardePortalOnMonoLPMREF.disable()
	myDoor.disable()
	self.PlayAnimation("PlayAnim01")
	seal.PlayAnimation("Close")
	;turnLight for fx on
	myLight.disable()
	utility.wait(3.3)
	;cancel the stormy weather
;	weather.ReleaseOverride()
	isOpen = false
; 	debug.trace(self + " closing portal DONE")
	goToState("waiting")
endFunction

ObjectReference Property MyDoor  Auto  
{door to enable/disable as appropriate}

ObjectReference Property Seal  Auto  

ObjectReference Property myStaff  Auto  
{static staff to enable/disable when activated}

Weapon Property MQ303DragonPriestStaff  Auto  
