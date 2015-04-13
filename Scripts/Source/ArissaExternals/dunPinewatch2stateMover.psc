scriptName dunPinewatch2StateMover extends objectReference
;
;
;=========================================================

objectReference property position1Ref auto
objectReference property position2Ref auto
sound property moveSound auto
float property moveSpeed = 200.0 auto

auto state position1
	event onActivate(objectReference TriggerRef)	;activated while in position 1, move to position 2
; 		debug.Trace(self + " has been activated in state position1")
		goToState("movingToPosition2")
		movesound.play(Self)
		TranslateToRef(position2Ref, moveSpeed)
	endEvent
endState

state movingToPosition2
	event onActivate(objectReference TriggerRef)	;activated while moving to position 2, move back to position 1
; 		debug.Trace(self + " has been activated in state movingToPosition2")
		goToState("movingToPosition1")
		StopTranslation()
		movesound.play(Self)
		TranslateToRef(position1Ref, moveSpeed)
	endEvent
endState

state position2
	event onActivate(objectReference TriggerRef)	;activated while in position 2, move to position 1
; 		debug.Trace(self + " has been activated in state position1")
		goToState("movingToPosition1")
		movesound.play(Self)
		TranslateToRef(position1Ref, moveSpeed)
	endEvent
endState

state movingToPosition1
	event onActivate(objectReference TriggerRef)	;activated while moving to position 1, move back to position 2
; 		debug.Trace(self + " has been activated in state movingToPosition1")
		goToState("movingToPosition2")
		StopTranslation()
		movesound.play(Self)
		TranslateToRef(position2Ref, moveSpeed)
	endEvent
endState
