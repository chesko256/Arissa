Scriptname CR01BeastScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(20)
EndEvent
