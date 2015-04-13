Scriptname C00KodlakVilkasSceneStarter extends ObjectReference  

Scene Property SceneToStart auto
Quest Property CompanionsIntro auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		if (CompanionsIntro.GetStage() <= 10)
			SceneToStart.Start()
			Delete()
		endif
	endif
EndEvent
