scriptName dunLostValleyHagravenHitScript extends referenceAlias

QF_dunLostValleyRedoubtQST_000B0F5B property myQuestScript auto hidden

Quest property myQuest auto hidden



auto state waiting
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		goToState("Done")
		myQuest = getOwningQuest()
		myQuestScript = (myQuest as QF_dunLostValleyRedoubtQST_000B0F5B)
		myQuestScript.setHagravensAttacked()
	endEvent
endState


state Done
endState
