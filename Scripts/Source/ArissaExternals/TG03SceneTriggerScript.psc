Scriptname TG03SceneTriggerScript extends ObjectReference  Conditional

int Property pTG03SceneDone Auto
Quest Property pTG03Quest Auto
Quest Property pTG03SPQuest Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG03Quest.GetStageDone(90) == 1
			if pTG03SceneDone == 0
				pTG03SPQuest.SetStage(10)
				pTG03SceneDone = 1
			endif
		endif
	endif

endEvent