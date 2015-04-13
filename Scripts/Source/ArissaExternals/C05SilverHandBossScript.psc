Scriptname C05SilverHandBossScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	GetOwningQuest().SetObjectiveCompleted(11, 1)
EndEvent
