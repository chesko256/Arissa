Scriptname DawnstarSancOutsideDoorTrigScript extends ObjectReference  

Quest Property DB07  Auto  
Quest Property DarkBrotherhoodQuest  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

If(game.getPlayer()==AkActivator)
	if DB07.GetStage () == 50
		if DBScript.CiceroDead == 0
			DB07.SetStage(60)
			pCicero.GetRef().Disable()
			Disable()
		Endif
	Endif
Endif

EndEvent



ReferenceAlias Property pCicero  Auto  
