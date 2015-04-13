Scriptname DA06LargashburOrcScript extends ObjectReference  

Quest Property DA06  Auto  



Event OnDeath(Actor AkKiller)

DA06QuestScript DA06Script = DA06 as DA06QuestScript


	if AkKiller == Game.GetPlayer()
		if DA06.GetStage() < 200
			DA06Script.OrcsKilled = DA06Script.OrcsKilled + 1
			DA06.RegisterForUpdate(5)
		endif
	endif

EndEvent