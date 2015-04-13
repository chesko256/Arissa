Scriptname DA16SceneTriggerScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDA16Quest.GetStage() < 5
			if (pDA16Quest as DA16QuestScript).pDA16SceneStarter == 0
				pDA16Quest.SetStage(5)
				(pDA16Quest as DA16QuestScript).pDA16SceneStarter = 1
			endif
		endif
	endif

endEvent