Scriptname MQ203PuzzleRingScript extends ObjectReference  

import game
import debug
import utility

; ///////////////////////////////////////////
; //PHIL: Ring Variables
BOOL PROPERTY bpuzzRing1 AUTO
BOOL PROPERTY bpuzzRing2 AUTO
BOOL PROPERTY bpuzzRing3 AUTO
BOOL PROPERTY bpuzzRing4 AUTO

; //the reference to the master script (dunKarthspirePuzzleMaster)
OBJECTREFERENCE PROPERTY controllerScript AUTO

; //main script variable
dunKarthspirePuzzleMaster mainScript

; // do once
bool bInitialized		; set to true after rings have initialized themselves, once only

; ///////////////////////////////////////////

event OnLoad()
	; followers can't activate
	SetNoFavorAllowed()
	initializeRings()
	; rings can't be activated until player knows about blood seal
	if MQ203.GetStage() < 150
		SetDestroyed(true)
	endif
endEvent

; waiting for player to activate
auto state waiting
	EVENT onActivate ( objectReference triggerRef )
		IF (triggerRef == GetPlayer() && mainScript.questDone == FALSE && MQ203.GetStageDone(150) == TRUE )
			gotoState("busy")
			; for now just turn on puzzle when player activates
			MQ203.SetStage(180)
			; pause for animation
			utility.wait(4)
			MQ203.SetStage(185)

			; put all of the rings into the proper position
			ringFinish()
			
			; //PHIL: jump right to active state on other scripts
			mainScript.questDone = TRUE
				
		ELSEIF(triggerRef == GetPlayer() && mainScript.questDone == TRUE && MQ203.getStage() < 200)	
			
			gotoState("busy")
			
			; //PHIL: which ring the player is activating while we're live
			IF(bPuzzRing1)
				mainScript.ringShift(1)
			ELSEIF(bPuzzRing2)
				mainScript.ringShift(2)
			ELSEIF(bPuzzRing3)
				mainScript.ringShift(3)
			ENDIF	
			
			wait(3)
			
			; //PHIL: Check to see if we're finished
			finishCheck()
			
		ENDIF
		
	endEvent
endState

; active, ready for player to interact
state active
	EVENT onActivate ( objectReference triggerRef )
		if triggerRef == GetPlayer()
			gotoState("busy")
			
			; //PHIL: which ring the player is activating while we're live
			IF(bPuzzRing1)
				mainScript.ringShift(1)
			ELSEIF(bPuzzRing2)
				mainScript.ringShift(2)
			ELSEIF(bPuzzRing3)
				mainScript.ringShift(3)
			ENDIF
			
			wait(3)
			
			; //PHIL: Check to see if we're finished
			finishCheck()
			
			; //PHIL: Print out where we're out
			trace("Ring1:"+mainScript.ring1State+" Ring2: "+mainScript.ring2State+" Ring3: "+mainScript.ring3State)
			
		endif
	endEvent
endState

; either in progress or 
state busy

	EVENT onActivate(objectReference trigRef)
	ENDEVENT

endState

Quest Property MQ203  Auto  

bool Property ActivatorFlag  Auto  
{set to true on the ring that the player uses to 
"turn on" puzzle}

; //////////////////////////
; //FUNCTION: finishCheck
; //
; //PURPOSE: A function that checks to see if the
; //puzzle is complete and advances the quest stage
; //////////////////////////////////////////////////
FUNCTION finishCheck()
	
	; //PHIL: if the puzzle is complete, advance, if not, return to the active state
	IF(mainScript.ring1State == mainScript.ring2State && mainScript.ring2State == mainScript.ring3State && mainScript.ring4State)
	
		; //PHIL: advance the quest stage and open the door
		LightEnabler.Enable()
		MQ203.SetStage(200)
	ELSE
		gotoState("active")
		
	ENDIF

ENDFUNCTION

FUNCTION ringFinish()
	BloodSealEffect.playAnimation("playanim01")

	mainScript.ringShift(1)
	mainScript.ringShift(2)
	mainScript.ringShift(3)
	
	wait(3)

	BloodSealEffect.playAnimation("playanim02")
	mainScript.ringShift(1)
	mainScript.ringShift(2)
	
	wait(3)
	
	mainScript.ringShift(1)
	MQ203.SetStage(200)
	LightEnabler.Enable()

	wait(6)

	BloodSealEffect.playAnimation("playanim03")
	
ENDFUNCTION

function initializeRings()
	if !bInitialized
		; //PHIL: setting the master script to be the one with the stored vars
		mainScript = controllerScript AS dunKarthspirePuzzleMaster
	
		; //PHIL first time we get here hookup the rings
		; //KURT -- only once!
		if bpuzzRing1
			mainScript.puzzRing1.playAnimation("startRotate02")
			mainScript.puzzRing2.playAnimation("startRotate03")
			mainScript.puzzRing3.playAnimation("startRotate04")
			mainScript.ring1State = 2
			mainScript.ring2State = 3
			mainScript.ring3State = 4
		endif

		bInitialized = true
	endif
endFunction

ObjectReference Property LightEnabler  Auto  
{enable marker for turning on lights}

ObjectReference Property BloodSealEffect  Auto  
