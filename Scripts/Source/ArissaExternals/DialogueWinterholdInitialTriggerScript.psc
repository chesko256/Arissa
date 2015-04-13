Scriptname DialogueWinterholdInitialTriggerScript extends ObjectReference  

Quest Property DialogueQuest  Auto  



Event OnTriggerEnter (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		DialogueWinterholdInitialSceneQScript QuestScript = DialogueQuest as DialogueWinterholdInitialSceneQScript
		if QuestScript.QuestRun == 0 
			QuestScript.QuestRun=1
			InitialScene.Start()
			EnableParentRef.Disable()
		endif
	endif




EndEvent
Scene Property InitialScene  Auto  

ObjectReference Property EnableParentRef  Auto  
