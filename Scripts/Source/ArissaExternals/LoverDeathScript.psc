ScriptName LoverDeathScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	GetOwningQuest().SetStage(250)

EndEvent

