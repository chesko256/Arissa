scriptName SpringTrap extends TrapTriggerBase
;
;
;
;================================================================

weapon property pressEffect auto
import game

State Active
	Event onBeginState()
		objectReference selfRef = self
		goToState( "DoNothing" )
		pressEffect.fire(selfRef)
		activate(self as objectReference)
		float springImpulse = 30 * lastTriggerRef.getMass()
		if lastTriggerRef as actor
			self.pushActorAway(lastTriggerRef as actor, 10)
		else
			lastTriggerRef.applyHavokImpulse(0.0, 0.0, 1.0, SpringImpulse)
		endif
		playAnimationAndWait( "trigger", "reset" )
		goToState( "Inactive" )
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
