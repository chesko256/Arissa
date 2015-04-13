Scriptname ArenaTransitionCombatQuest extends ArenaCombatQuest  

ReferenceAlias Property Combatant auto
ReferenceAlias Property CombatantSpot auto



Faction Property SelfLoathing auto
Faction Property ArenaFaction auto

Function SetupTransition(bool isTransition=true)
; 	Debug.Trace("ARENA: Calling setup transition...")
	parent.Setup()
	IsTransitionFight = isTransition
EndFunction

Function PlayerEnteredArena()
	Actor ref = Combatant.GetActorReference()
	Game.GetPlayer().AddToFaction(SelfLoathing)
	ref.AddToFaction(SelfLoathing)
	ref.RemoveFromFaction(ArenaFaction)
	ref.MoveTo(CombatantSpot.GetReference())

	parent.PlayerEnteredArena()
EndFunction

Function Cleanup()
	Actor ref = Combatant.GetActorReference()
	Game.GetPlayer().RemoveFromFaction(SelfLoathing)
	ref.RemoveFromFaction(SelfLoathing)
	ref.SetFactionRank(ArenaFaction, 4)
	parent.Cleanup()
EndFunction
