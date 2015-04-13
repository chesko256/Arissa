Scriptname norRotatingDoorSCRIPT extends ObjectReference  
{THIS SHOULD BE ON THE LEVER A customizeable script for the nordic rotating doors THIS SHOULD BE ON THE LEVER}

import debug
import utility
import game
import sound

; the door we're manipulating
OBJECTREFERENCE myDoor

; does it start open
BOOL PROPERTY startOpen AUTO

; //the start and stop sounds
SOUND PROPERTY startingSound AUTO
SOUND PROPERTY stoppingSound AUTO

INT soundID

; // ON INIT MAKE SURE WE'RE IN THE DEFAULT POSITION
EVENT onLoad()
	
		; a linked reference to the door
		myDoor = getLinkedREF()
	
		IF(!startOpen)
			myDoor.playAnimation("SnapOpen")
		ELSE
			myDoor.playAnimation("SnapClosed")
		ENDIF
	
endEVENT

AUTO STATE OFFpos
	EVENT onActivate (objectReference triggerRef)
		
		;soundID = startingSound.play(SELF)
		
		IF(!startOpen)
	
			myDoor.playAnimationandWait("RotateClosed", "snapClosed")
			startOpen = TRUE
			
		ELSE
		
			myDoor.playAnimationandWait("RotateOpen", "snapOpen")
			startOpen = FALSE
		ENDIF
		
		;stopInstance(soundID)
		
	ENDEVENT
ENDSTATE


STATE busyState
	; don't do anything while I'm busy.
ENDSTATE
