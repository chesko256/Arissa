Scriptname MS09NonCombatTrigger1Script extends ObjectReference

Quest Property MS09  Auto  

Faction Property MS09PlayerAllyFaction 	Auto


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()

		Game.GetPlayer().SetFactionRank (MS09PlayerAllyFaction, 0)

		if MS09.GetStage() == 40
			MS09.SetStage(55)
		elseif MS09.GetStage() == 50
			MS09.SetStage(55)
		endif
	endif

EndEvent