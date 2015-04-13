scriptName TrapBreakAwayBase extends objectReference
;
;
;============================================
import utility
sound property BreakSound auto
bool doOnce = FALSE
float property initialDelay = 0.5 auto

auto State UnBroken
	Event OnTriggerEnter(ObjectReference triggerRef)
	GoToState("Destroyed")
		if doOnce == FALSE
			doOnce = TRUE
			wait( initialDelay )		;wait for windup
			SetMotionType(1)
			BreakSound.play( self as ObjectReference)		;play windup sound
			ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
			ApplyHavokImpulse(0.0, 0.0, -1.0, 50.0)
		endif
	endEvent
EndState

State Destroyed
endState

Event OnLoad()
	SetMotionType(4)
EndEvent

Event OnUnLoad()
	SetMotionType(1)
EndEvent

