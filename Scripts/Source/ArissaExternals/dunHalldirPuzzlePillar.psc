scriptName dunHalldirPuzzlePillar extends ObjectReference


import debug
import utility

bool pillarSolved
bool doOnce

dunHalldirRotatingDoorPuzzle myLinkedRef

int property initialState auto
{
This is the position the pillar starts out in.
1 = Position 1 (eagle)
2 = Position 2 (snake)
3 = Position 3 (whale)
Position 1,2,3 refer to the havok animations
}

int property solveState auto
{
This is the position the pillar needs to be in to be considered solved.
1 = Position 1 (eagle)
2 = Position 2 (snake)
3 = Position 3 (whale)
Position 1,2,3 refer to the havok animations
}

Event OnCellLoad()
	myLinkedRef = GetLinkedRef() as dunHalldirRotatingDoorPuzzle
	
	;account for case where initialState and solveState are equal in the beginning
	if(!doOnce)
		if (initialState == solveState)
			myLinkedRef.numPillarsSolved = myLinkedRef.numPillarsSolved + 1
			pillarSolved = true
		endif
		;now move the pillar into initialState
		if (initialState == 1)
			;no animation
			gotoState("position01")
		elseif (initialState == 2)
			playAnimation("StartState02")
			gotoState("position02")
		elseif (initialState == 3)
			playAnimation("StartState03")
			gotoState("position03")
		endif
		
		doOnce = true
	endif

; 	Debug.Trace("ON LOAD: " + initialState + " " + solveState + "   --    " + myLinkedRef.numPillarsSolved)
endEvent

Event OnReset()
	;Delay to make sure the lever has time to reset first...
; 	;Debug.Trace("ON RESET")
	;Utility.Wait(1)
	;OnLoad()
EndEvent

; Makes the pillar rotate to the next state and checks whether it is 'solved' as a result	
FUNCTION RotatePillarToState(int stateNumber, int animEventNumber)
		gotoState ("busy")
		if (solveState == stateNumber)
			;trace(self + " pillar solved!")
			myLinkedRef.numPillarsSolved = myLinkedRef.numPillarsSolved + 1
			pillarSolved = true
; 			Debug.Trace("Solved = True")
		elseif (pillarSolved == True)
			myLinkedRef.numPillarsSolved = myLinkedRef.numPillarsSolved - 1
			pillarSolved = False
; 			Debug.Trace("Solved = False")
		endif
		playAnimationandWait("Trigger0" + animEventNumber, "Turned0" + animEventNumber)
endFUNCTION

	
STATE position01
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(2, 1)
		gotoState("position02")
	endEVENT
endState


STATE position02
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(3, 2)
		gotoState("position03")
	endEVENT
endState


STATE position03
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(1, 3)
		gotoState("position01")
	endEVENT
endState


STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE
