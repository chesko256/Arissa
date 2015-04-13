Scriptname DA06LargashburHostileResetScript extends ObjectReference  

Quest Property DA06  Auto  

Faction Property PlayerFaction  Auto  

Faction Property TownLargashburFaction  Auto  


Event OnDetachedFromCell()

if DA06.IsRunning() == 0
	TownLargashburFaction.SetEnemy(PlayerFaction, true, true)
endif

EndEvent


Event OnCellDetach()

if DA06.IsRunning() == 0
	TownLargashburFaction.SetEnemy(PlayerFaction, true, true)
endif

EndEvent