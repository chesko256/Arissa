Scriptname dunKarthspirePuzzleMaster extends ObjectReference  Conditional
{The master control script for the ring puzzle, it will keep all of the ring variables}

; **********************************
; ** THE STUFF FOR THE PILLAR PUZZLE
; **********************************
INT PROPERTY pillarAState AUTO HIDDEN Conditional
INT PROPERTY pillarBState AUTO HIDDEN Conditional
INT PROPERTY pillarCState AUTO HIDDEN Conditional

BOOL PROPERTY pillarSolved=FALSE AUTO HIDDEN Conditional

OBJECTREFERENCE PROPERTY flameA AUTO
{PP: the flame for showing the way}
OBJECTREFERENCE PROPERTY flameB AUTO
{PP: the flame for showing the way}
OBJECTREFERENCE PROPERTY flameC AUTO
{PP: the flame for showing the way}
OBJECTREFERENCE PROPERTY flameD AUTO
{PP: the flame for showing the way}

; *********************************
; ** THE STUFF FOR THE PLATE PUZZLE
; *********************************
BOOL PROPERTY plateTriggered=FALSE AUTO HIDDEN Conditional		; set to true when the player triggers a plate

BOOL PROPERTY plateSolved=FALSE AUTO HIDDEN Conditional

; *********************************
; ** THE STUFF FOR THE RING PUZZLE
; *********************************
INT PROPERTY ring1State AUTO HIDDEN
INT PROPERTY ring2State AUTO HIDDEN
INT PROPERTY ring3State AUTO HIDDEN
INT PROPERTY ring4State AUTO HIDDEN

BOOL PROPERTY questDone=FALSE AUTO HIDDEN

OBJECTREFERENCE PROPERTY puzzRing1 AUTO
OBJECTREFERENCE PROPERTY puzzRing2 AUTO
OBJECTREFERENCE PROPERTY puzzRing3 AUTO
OBJECTREFERENCE PROPERTY puzzRing4 AUTO

; //FUNCTION: ringShift
; //int ring: an int representing the ring to spin
; //
; //PURPOSE: A cleaner way to spin the rings, plus it 
; //lets us manipulate one function instead of 3 seperate
; //ones.

FUNCTION ringShift(int ring)

	IF(ring == 1)
		IF(ring1State == 1)
			puzzRing1.playAnimation("Ring01Rotate01")
			ring1State = 2
		ELSEIF(ring1State == 2)
			puzzRing1.playAnimation("Ring01Rotate02")
			ring1State = 3
		ELSEIF(ring1State == 3)
			puzzRing1.playAnimation("Ring01Rotate03")
			ring1State = 4
		ELSEIF(ring1State == 4)
			puzzRing1.playAnimation("Ring01Rotate04")
			ring1State = 1
		ENDIF
	
	ELSEIF(ring == 2)
		IF(ring2State == 1)
			puzzRing2.playAnimation("Ring01Rotate01")
			ring2State = 2
		ELSEIF(ring2State == 2)
			puzzRing2.playAnimation("Ring01Rotate02")
			ring2State = 3
		ELSEIF(ring2State == 3)
			puzzRing2.playAnimation("Ring01Rotate03")
			ring2State = 4
		ELSEIF(ring2State == 4)
			puzzRing2.playAnimation("Ring01Rotate04")
			ring2State = 1
		ENDIF
	
	ELSEIF(ring == 3)
		IF(ring3State == 1)
			puzzRing3.playAnimation("Ring01Rotate01")
			ring3State = 2
		ELSEIF(ring3State == 2)
			puzzRing3.playAnimation("Ring01Rotate02")
			ring3State = 3
		ELSEIF(ring3State == 3)
			puzzRing3.playAnimation("Ring01Rotate03")
			ring3State = 4
		ELSEIF(ring3State == 4)
			puzzRing3.playAnimation("Ring01Rotate04")
			ring3State = 1
		ENDIF
		
	ELSEIF(ring == 4)
		IF(ring4State == 1)
			puzzRing3.playAnimation("Ring01Rotate01")
			ring4State = 2
		ELSEIF(ring4State == 2)
			puzzRing4.playAnimation("Ring01Rotate02")
			ring4State = 3
		ELSEIF(ring4State == 3)
			puzzRing4.playAnimation("Ring01Rotate03")
			ring4State = 4
		ELSEIF(ring4State == 4)
			puzzRing4.playAnimation("Ring01Rotate04")
			ring4State = 1
		ENDIF
	
	ENDIF

ENDFUNCTION
