scriptName Tripwire extends TrapTriggerBase
;
;
;
;================================================================
; event onActivate(objectReference akActivator)
	; if (akActivator as actor) && akActivator != (self as objectReference)
		; goToState("Active")
	; endif
; endEvent


State Active
	Event OnBeginState()
		SetMotionType(1)
		TriggerSound.play( self as ObjectReference)		;play trigger sound
		self.blockActivation(false)
		activate(self as objectReference)
		self.blockActivation(true)
		PlayAnimation("Trigger")
		goToState("DoNothing")
		;applyHavokImpulse 15 0 0 -1		;push down at a force of 15 to break the havok constraint.

	endEvent
	
	event onActivate(objectReference akActivator)
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	endEvent 
endState

State DoNothing			;Dummy state, don't do anything if animating
	event onBeginState()
		setDestroyed(true)
	endEvent

	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
	
	event onCellAttach()
	endEvent
EndState

Event OnCellAttach()
	SetMotionType(4)
EndEvent

;/
Event OnCellDetach()
	SetMotionType(1)
EndEvent
/;

function localActivateFunction()
	goToState("Active")
endFunction

Event onReset()
	self.reset()
	SetMotionType(4)
	self.clearDestruction()
	self.setDestroyed(False)
	goToState("Inactive")
	CountUsed = 0
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	;debug.Trace(self + ": was hit by " + akAggressor + " with " + akSource + " or " + akProjectile)
	goToState("Active")
endEvent

