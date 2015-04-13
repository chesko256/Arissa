Scriptname WhiterunCivilWarArgueTriggerScript extends ReferenceAlias  

Quest Property ArgueQuest  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

DialogueWhiterunArgueScript QuestScript = ArgueQuest as DialogueWhiterunArgueScript


	if ActionRef == Game.GetPlayer()
		if QuestScript.SceneTrigger == 0
			QuestScript.SceneTrigger = 1
		endif
	endif

EndEvent 