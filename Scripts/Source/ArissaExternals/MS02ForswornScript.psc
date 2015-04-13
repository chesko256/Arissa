ScriptName MS02ForswornScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	If akKiller == Game.GetPlayer()
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent