Scriptname highGateRuinsLeverPuzzle extends ObjectReference  
{A script to control the lever puzzle in HighGateRuins01, it consists of two levers, four flames, an xmarker and a door.}

import utility

;the four levers
BOOL PROPERTY leverEagleA AUTO
BOOL PROPERTY leverFox AUTO
BOOL PROPERTY leverWhale AUTO
BOOL PROPERTY leverSnake AUTO

;the four flames
OBJECTREFERENCE PROPERTY flameEagleA AUTO
OBJECTREFERENCE PROPERTY flameFox AUTO
OBJECTREFERENCE PROPERTY flameWhale AUTO
OBJECTREFERENCE PROPERTY flameSnake AUTO

OBJECTREFERENCE PROPERTY leverA AUTO
OBJECTREFERENCE PROPERTY leverB AUTO
OBJECTREFERENCE PROPERTY leverC AUTO
OBJECTREFERENCE PROPERTY leverD AUTO

;the xmarker to activate for the door
OBJECTREFERENCE PROPERTY openMarker AUTO

;the door
OBJECTREFERENCE PROPERTY puzzDoor AUTO

;the Quest
QUEST PROPERTY lQuest AUTO

BOOL correct

auto STATE upPosition
	EVENT onActivate (objectReference triggerRef)
				
		;gotoState("busy")
		
		; // Eagle, Whale, Fox, Snake
		IF(triggerRef == game.getPlayer() && correct == FALSE)
		
			
			playAnimationandWait("FullPush","FullPushedUp")
			
			IF(leverEagleA)
				
				IF(flameEagleA.isDisabled() && flamefox.isDisabled() && flameWhale.isDisabled() && flameSnake.isDisabled())
					flameEagleA.enable()
					correct = TRUE
				ELSE
					killSwitch()
				ENDIF	
				
			ELSEIF(leverFox)
				IF(flameSnake.isDisabled() && flamefox.isDisabled())
					flamefox.enable()
					correct = TRUE
				ELSE
					killSwitch()
				ENDIF
				
			ELSEIF(leverWhale)
				IF(flameEagleA.isDisabled() == FALSE)
					flameWhale.enable()
					correct = TRUE
				ELSE
					killSwitch()
				ENDIF
			
			ELSEIF(leverSnake)
				IF(flamefox.isDisabled() == FALSE)
					
					flameSnake.enable()
					
					wait(0.5)
					
					; progress the quest and open the door
					lQuest.setStage(30)
					puzzDoor.activate(openmarker)
				ELSE
					killSwitch()
				ENDIF
			
			ENDIF
		
		ENDIF
			
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;trace ("Switch Busy")
		endEVENT
		
endSTATE

; //A simple function to kill all of the fires
FUNCTION killSwitch()

	wait(1)

	playAnimationandWait("FullPull","FullPulledUp")
	
ENDFUNCTION 
