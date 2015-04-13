scriptName TrapRiggedBeam extends TrapTriggerBase
;
;
;
;================================================================

State Active
	Event OnBeginState()	
		SetMotionType(1)
		TriggerSound.play( self as ObjectReference)		;play trigger sound
		activate(self as objectReference)
		;PlayAnimation("Trigger")
		
		;applyHavokImpulse 15 0 0 -1		;push down at a force of 15 to break the havok constraint.

	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
EndState

Event OnLoad()
	SetMotionType(4)
EndEvent

Event OnUnLoad()
	SetMotionType(1)
EndEvent

Event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	goToState("Active")
endEvent



