ScriptName FavorNPCDeathScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	GetOwningQuest().SetStage(200)
	
EndEvent
