scriptName TrapTriggerHinge extends TrapTriggerBase
;
;
;
;================================================================


int popmessage
bool triggeredOnce = False
objectReference objectSelf
objectReference trapLinkedRef
keyword property TrapKeyword auto
message property LockpickMessage auto
sound property disarmSound auto

event onCellLoad()
	objectSelf = self as ObjectReference
	trapLinkedRef = getLinkedRef(TrapKeyword) as objectReference
	if trapLinkedRef as trapTriggerBase
		(trapLinkedRef as trapTriggerBase).triggerType = triggertype
	endif
endEvent

auto State Active
	;Over ride trapTriggerBase events
	event onBeginState()
	endevent
	
	event onTriggerEnter(objectReference triggerRef)
	endevent
	
	event onTriggerLeave(objectReference triggerRef)
	endevent
	
	event OnMagicEffectApply(objectReference akCaster, MagicEffect akEffect)
	endevent

	;Activation
	event onActivate(objectReference triggerRef)
		if triggerRef as actor == game.getPlayer()
			if !isLocked()
				goToState("Disarmed")
			endif
		else
; 			;;Debug.Trace(self + " has been activated by " + triggerRef)
			goToState("Triggered")
		EndIf
	EndEvent
	
	event onLockStateChanged()
		if !isLocked()
			goToState("Disarmed")
		elseif isLockBroken()
			goToState("Triggered")
		else
			;goToState("Active")
		endif
	endEvent
	
	event onHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if TriggeredOnce == False
; 			;Debug.Trace(self + " has been hit by " + akAggressor)
			goToState("Triggered")
		EndIf
	EndEvent
EndState



state Disarmed
	event onBeginState()
		if disarmSound
			disarmSound.play(self)
		endif
		playanimation("Disarm01")
		setDestroyed(true)
	EndEvent
EndState

state Triggered
	event onBeginState()
		(trapLinkedRef).activate(objectSelf)
		setDestroyed(true)
		playAnimation("Trigger01")
	EndEvent
endState

event onTriggerEnter(objectReference triggerRef)
endEvent

event onTriggerLeave(objectReference triggerRef)
endEvent
		
state Inactive
endState

event onReset()
	self.Reset()
	self.clearDestruction()
	self.setDestroyed(False)
	goToState("Active")
endEvent
