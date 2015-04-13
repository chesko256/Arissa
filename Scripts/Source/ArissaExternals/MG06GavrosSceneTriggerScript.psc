Scriptname MG06GavrosSceneTriggerScript extends ObjectReference  Conditional

quest Property mg06  Auto  

int Property GavrosSceneUpdate  Auto  Conditional

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MG06.GetStage() >= 10
			if MG06.GetStage() == 20
				MG06.SetStage(25)
			endif
			if DoOnce == 0
				GavrosSceneUpdate=1
				DoOnce == 1
			endif
		endif
	endif


EndEvent