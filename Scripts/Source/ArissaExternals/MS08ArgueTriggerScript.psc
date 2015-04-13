Scriptname MS08ArgueTriggerScript extends ObjectReference  

Keyword Property MS08ArgueKeyword  Auto  

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

MS08ArgueQuestScript QuestScript = MS08ArgueQuest as MS08ArgueQuestScript


	if ActionRef == Game.GetPlayer()
		if QuestScript.SceneUpdate == 0
			QuestScript.SceneUpdate = 1
			Disable()
		endif
	endif

EndEvent
quest Property MS08ArgueQuest  Auto  
