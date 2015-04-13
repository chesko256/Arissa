scriptName TrapRiggedRockfall Extends TrapBase
;
;
;=============================================


auto State Idle
	
	event onActivate (objectReference activateRef)
		goToState("DoNothing")
; 		;debug.TRACE("Idle trigger")
		lastActivateRef = activateRef
		playAnimation("break")
		;activate rocks if necessary
	endEvent
endState

state DoNothing
endState
