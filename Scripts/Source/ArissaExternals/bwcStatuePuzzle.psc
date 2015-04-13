Scriptname bwcStatuePuzzle extends ObjectReference  
{The light puzzle with Nocturnal's statue and turning off the lights.}

; the two flames to be extinguished
OBJECTREFERENCE PROPERTY leftFlame AUTO
OBJECTREFERENCE PROPERTY rightFlame AUTO

; which lever
BOOL PROPERTY leftLever AUTO
BOOL PROPERTY rightLever AUTO

; the door and marker to open it
OBJECTREFERENCE PROPERTY doorMarker AUTO
OBJECTREFERENCE PROPERTY puzzDoor AUTO


; the lights
OBJECTREFERENCE PROPERTY brightLightLeft AUTO
OBJECTREFERENCE PROPERTY brightLightRight AUTO
OBJECTREFERENCE PROPERTY brightLightBack AUTO
OBJECTREFERENCE PROPERTY dimLight AUTO

; the sounds
OBJECTREFERENCE PROPERTY leftSound AUTO
OBJECTREFERENCE PROPERTY rightSound AUTO

BOOL doOnce=TRUE

EVENT ONACTIVATE(objectReference trigRef)

	IF(doOnce) ;(trigRef as ACTOR) == game.getPlayer())
		
		playAnimationAndWait("FullPush","FullPushedUp")
		
		; shut off the appropriate flame
		IF(leftLever)
			leftSound.enable()
			utility.wait(0.4)
			leftFlame.disable()
			brightLightLeft.disable()
						
			IF(rightSound.isDisabled() != 1)
				brightLightBack.disable()
				puzzDoor.activate(doorMarker)
			ENDIF
		
		ELSEIF(rightLever)
			rightSound.enable()
			utility.wait(0.4)
			rightFlame.disable()
			brightLightRight.disable()
						
			IF(leftSound.isDisabled() != 1)
				brightLightBack.disable()
				puzzDoor.activate(doorMarker)
			ENDIF
		
		ENDIF
		
		doOnce = FALSE
		
	ENDIF

ENDEVENT
