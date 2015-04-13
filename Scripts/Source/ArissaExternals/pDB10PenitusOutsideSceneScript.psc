Scriptname pDB10PenitusOutsideSceneScript extends ObjectReference  

Quest Property DB09  Auto 
Scene Property pPenitusOutsideScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB09.GetStage()==10)
		pPenitusOutsideScene.Start()
		Disable()
	Endif
Endif

EndEvent


