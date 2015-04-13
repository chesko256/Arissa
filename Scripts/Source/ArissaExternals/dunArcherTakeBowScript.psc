Scriptname dunArcherTakeBowScript extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

Quest property dunArcherQST auto
dunArcherQuestScript myQuest

;************************************

auto STATE waitingForPlayer
	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		;object is added to player's inventory
		myQuest = dunArcherQST as dunArcherQuestScript
		gotoState("hasBeenTriggered")
		myQuest.PlayerTookBow = 1
	endEvent

endSTATE

;************************************

STATE hasBeenTriggered
	; this state doesn't do anything
endSTATE

;************************************