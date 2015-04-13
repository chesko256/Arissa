ScriptName MS01WeylinScript extends ReferenceAlias

ReferenceAlias Property Eltrys Auto
Quest Property MS01IntroWorldScene Auto

Event OnDeath(Actor akKiller)

	Game.GetPlayer().RemoveFromFaction(GuardFactionMarkarth)
	MS01IntroWorldScene.SetStage(200)

EndEvent

Faction Property GuardFactionMarkarth  Auto  
