Scriptname TG05SceneModTriggerScript extends ObjectReference  Conditional

int pTG05ModTrigDone
ObjectReference Property pTG05KarliahRef Auto
Quest Property pTG05SPQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == pTG05KarliahRef
		(pTG05SPQuest as TG05SPQuestScript).pTG05SceneMover = 2
		pTG05SPQuest.SetStage(20)
		pTG05ModTrigDone = 1
	endif

endEvent