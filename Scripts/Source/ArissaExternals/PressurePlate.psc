scriptName PressurePlate extends TrapTriggerBase
;
;
;
;================================================================

weapon property pressEffect auto
ammo property pressEffectAmmo auto

State Active
	Event onBeginState()
		objectReference selfRef = self
		goToState( "DoNothing" )
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
; 		debug.Trace(self + ": is calling onBeginState Active")
; 		debug.Trace(self + ": StoredTriggerType = " + StoredTriggerType + ", objectsInTrigger = " + objectsInTrigger)
		if (StoredTriggerType == 1)
			Type = 3
			utility.wait(0.1)
			activate(self as objectReference)
			utility.wait(0.1)
			;Type = 1
		else
			activate(self as objectReference)
		endif
		;playAnimationAndWait( "trigger", "reset" )
		TriggerSound.play(self)
		playAnimation("Down")
		if objectsInTrigger == 0
			goToState( "Inactive" )
			playAnimation("Up")
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Inactive")
			playAnimation("Up")
		endif
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
; 		debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Inactive")
			playAnimation("Up")
		endif
	endEvent
EndState
