Scriptname dunCGPlayerInSquareTriggerScript extends ObjectReference  

import debug
import utility

Quest property dunCGQST auto
Actor property myDragon auto
MQ101DragonAttackQuestScript myQuest

bool dragonAttacking = false


;************************************

Event OnLoad()
	myQuest = dunCGQST as MQ101DragonAttackQuestScript
endEvent

Event onUpdate()
	;UnRegisterForUpdate()
	while(myQuest.PlayerInSquare == 1 && dragonAttacking == false)
		if (myQuest.getStage() >= 10 && myQuest.getStage() < 200)
			myDragon.startCombat(game.GetPlayer())
			dragonAttacking = true
		endif
		wait(5)
	endWhile
endEvent

;************************************

auto State Waiting
	
	Event onTriggerEnter (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			myQuest.PlayerInSquare = 1
			RegisterForSingleUpdate(0.5)
		endif
	endEvent

	Event onTriggerLeave (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			myQuest.PlayerInSquare = 0
			myDragon.stopCombat()
			dragonAttacking = false
		endif
	endEvent
	
endState

;************************************

State done
	;do nothing
endState

;************************************
