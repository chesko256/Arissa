Scriptname dunKarthspirePlatePuzzleLeverSCRIPT extends ObjectReference  

; //the reference to the master script (dunKarthspirePuzzleMaster)
OBJECTREFERENCE PROPERTY castSource AUTO

; //main script variable
dunKarthspirePuzzleMaster mainScript

BOOL doOnce=FALSE

OBJECTREFERENCE PROPERTY flameA AUTO
OBJECTREFERENCE PROPERTY flameB AUTO
OBJECTREFERENCE PROPERTY flameC AUTO
OBJECTREFERENCE PROPERTY flameD AUTO
OBJECTREFERENCE PROPERTY flameE AUTO

EVENT onLoad()

	; //setting the master script to be the one with the stored vars
	mainScript = castSource AS dunKarthspirePuzzleMaster

endEVENT

EVENT onActivate(OBJECTREFERENCE trigRef)

	IF(trigRef == game.getPlayer() && doOnce == FALSE)
		doOnce = TRUE
		mainScript.plateSolved = TRUE
				
		playAnimationandWait("FullPush","FullPushedUp")
		
		flameA.setAnimationVariableFloat("fToggleBlend", 1)
		flameB.setAnimationVariableFloat("fToggleBlend", 1)
		flameC.setAnimationVariableFloat("fToggleBlend", 1)
		flameD.setAnimationVariableFloat("fToggleBlend", 1)
		flameE.setAnimationVariableFloat("fToggleBlend", 1)
		
	ENDIF

endEVENT
