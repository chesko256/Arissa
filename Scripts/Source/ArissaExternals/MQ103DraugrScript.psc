Scriptname MQ103DraugrScript extends ReferenceAlias  

{script for draugr in Korvanjund
tracks when all are dead in order to update
correct quest (MQ103A or MQ103B)
}

Event OnDeath(Actor akKiller)
	MQ103QuestScript myQuest = GetOwningQuest() as MQ103QuestScript
	myQuest.IncrementDraugrDeadCount(self.getActorRef())
endEvent

