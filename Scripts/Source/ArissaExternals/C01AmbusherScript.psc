Scriptname C01AmbusherScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	(GetOwningQuest() as C01QuestScript).AmbusherKilled()
EndEvent
