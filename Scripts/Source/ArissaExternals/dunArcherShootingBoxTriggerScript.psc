scriptName dunArcherShootingBoxTriggerScript extends ObjectReference

{
- This script keeps track of when player is in the shooting box
}

import debug
import utility

Quest property dunArcherQST auto
dunArcherQuestScript myQuest

;************************************
Event OnLoad()
	myQuest = dunArcherQST as dunArcherQuestScript
endEvent

Event onTriggerEnter(objectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if (actorRef == game.getPlayer())
		myQuest.playerInBox = 1
	endif
endEvent

Event onTriggerLeave(objectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if (actorRef == game.getPlayer())
		myQuest.playerInBox = 0
	endif
endEvent


;************************************

State DoNothing
	;do nothing
endState
;************************************