scriptName dunArcherSkillUpTriggerScript extends ObjectReference

{
- This script keeps track of archery skill up during the dunArcherQST
}

import debug
import utility

bool playerInTrigger
Quest property dunArcherQST auto
dunArcherQuestScript myQuest

;************************************
Event OnLoad()
	myQuest = dunArcherQST as dunArcherQuestScript
endEvent

Event onTriggerEnter(objectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if (actorRef == game.getPlayer())
		playerInTrigger = true
		;myQuest.playerInSkillUpBox = 1
	endif

endEvent

Event onTriggerLeave(objectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if (actorRef == game.getPlayer())
		playerInTrigger = false
		;myQuest.playerInSkillUpBox = 0
	endif
endEvent

;************************************

State DoNothing
	;do nothing
endState
;************************************