Scriptname MS08InteriorBaseTriggerScript extends ObjectReference  

Quest Property MS08  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

MS08QuestScript QuestScript = MS08 as MS08QuestScript


	if ActionRef == Game.GetPlayer()
		if MS08.GetSTage() >= 10
			if MS08.GetStage() < 75
				QuestScript.DungeonFound = 1
			else
				MS08.SetStage(100)
			endif
		endif
	endif


EndEvent