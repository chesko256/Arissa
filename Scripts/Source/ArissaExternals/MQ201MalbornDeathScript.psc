Scriptname MQ201MalbornDeathScript extends ReferenceAlias  

	Event OnDeath(Actor akKiller)
		GetOwningQuest().SetStage(300)
	endEvent

