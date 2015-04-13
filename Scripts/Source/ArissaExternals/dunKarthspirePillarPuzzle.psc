Scriptname dunKarthspirePillarPuzzle extends ObjectReference  

import debug
import utility

INT PROPERTY initialState AUTO

BOOL PROPERTY pillarA AUTO
BOOL PROPERTY pillarB AUTO
BOOL PROPERTY pillarC AUTO

; //the reference to the master script (dunKarthspirePuzzleMaster)
OBJECTREFERENCE PROPERTY controllerScript AUTO

; //main script variable
dunKarthspirePuzzleMaster mainScript

OBJECTREFERENCE PROPERTY drawBridge AUTO

QUEST Property MQ203 AUTO
BOOL bloadOnce=FALSE

EVENT OnLoad()
			
	; //setting the master script to be the one with the stored vars
	mainScript = controllerScript AS dunKarthspirePuzzleMaster
			
	; //now move the pillar into initialState
	IF(!bloadOnce)
		IF(initialState == 1)
			pillarSet(1)
			gotoState("position01")
					
		ELSEIF (initialState == 2)
			pillarSet(2)
			playAnimation("StartState02")
			gotoState("position02")
			
		ELSEIF (initialState == 3)
			pillarSet(3)
			playAnimation("StartState03")
			gotoState("position03")
			
		ENDIF
		
		
		
	ENDIF
	
endEVENT

STATE position01
	EVENT onActivate (objectReference triggerRef)
		
		IF(!mainScript.pillarSolved)
			rotatePillar(2, 1)
			gotoState("position02")
		ENDIF
		
	endEVENT
endSTATE


STATE position02
	EVENT onActivate (objectReference triggerRef)
		
		IF(!mainScript.pillarSolved)
			rotatePillar(3, 2)
			gotoState("position03")
		ENDIF
		
	endEVENT
endSTATE


STATE position03
	EVENT onActivate (objectReference triggerRef)
		
		IF(!mainScript.pillarSolved)
			rotatePillar(1, 3)
			gotoState("position01")
		ENDIF
		
	endEVENT
endSTATE


STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE

; Makes the pillar rotate to the next state and checks whether it is 'solved' as a result	
FUNCTION rotatePillar(INT stateNumber, INT animEventNumber)
		
		IF(mainScript.questDone == FALSE)
		
			gotoState ("busy")
			pillarSet(stateNumber)
			playAnimationandWait("Trigger0" + animEventNumber, "Turned0" + animEventNumber)
			
			IF(mainScript.pillarAState == 2 && mainScript.pillarBState == 2 && mainScript.pillarCState == 2)
				mainScript.pillarSolved = TRUE
				
				; //open the door
				drawBridge.activate(controllerScript)
				
				; //pop on the flames
				mainScript.flameA.setAnimationVariableFloat("fToggleBlend", 1)
				mainScript.flameB.setAnimationVariableFloat("fToggleBlend", 1)
				mainScript.flameC.setAnimationVariableFloat("fToggleBlend", 1)
				mainScript.flameD.setAnimationVariableFloat("fToggleBlend", 1)
				
			ENDIF
		ELSE	
			
		ENDIF
endFUNCTION

FUNCTION pillarSet(INT startState)

	IF(pillarA)
		mainScript.pillarAState = startState
	
	ELSEIF(pillarB)
		mainScript.pillarBState = startState
	
	ELSEIF(pillarC)
		mainScript.pillarCState = startState
	
	ENDIF

endFUNCTION 