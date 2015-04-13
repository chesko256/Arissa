Scriptname DB11MaroDockTriggerScript extends ObjectReference  

Scene Property pMaroDocksScene  Auto  
Quest Property DB11  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB11.GetStage()>=15)
		If(DB11.GetStage()<200)
 			DB11.SetObjectiveDisplayed (40)
			pMaroDocksScene.Start()
			Disable()
		Endif
	Endif
Endif

EndEvent


