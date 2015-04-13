scriptName SoundTrap extends TrapTriggerBase
;
;
;
;================================================================

weapon property triggerEffect auto
ammo property triggerEffectAmmo auto
explosion property havokNudge auto
import game

State Active
	Event onBeginState()
		goToState("DoNothing")
; 		;debug.Trace("Sound trap has fired")
		SetMotionType(1)
		objectReference selfRef = self
		;goToState( "DoNothing" )
		if triggerEffect
			triggerEffect.fire(selfRef, triggerEffectAmmo)
		endIf
		activate(self as objectReference)
		if triggerSound
			TriggerSound.play( self as ObjectReference)
		endIf
		if havokNudge
			self.placeAtMe(havokNudge)
		endIf
		CreateDetectionEvent(lastTriggerRef as actor, soundLevel) ; creates a detection event, 3 = generic event
		ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
		playAnimation( "trigger01" )
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
	
	event onCellAttach()
	endEvent
EndState

Event OnCellAttach()
	SetMotionType(4)
EndEvent

Event OnCellDetach()
EndEvent

event onReset()
	self.reset()
	goToState("Inactive")
endEvent
