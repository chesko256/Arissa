Scriptname pTG04StealthTriggerScript extends ObjectReference  Conditional

Quest Property pTG04Quest Auto
Quest Property pTG04SPQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()

		debug.Messagebox ("Stealth On!")

		if (pTG04Quest as TG04QuestScript).pTG04StealthOn == 1
			pTG04SPQuest.SetStage(20)
			(pTG04SPQuest as TG04SPQuestScript).pTG04StealthTriggerDone = 1
		endif
	endif

endEvent