Scriptname DB11EmperorShipTriggerScript extends ObjectReference  

Scene Property pEmperorGreetScene  Auto  
Quest Property DB11  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB11.GetStage()==20)
		pEmperorGreetScene.Start()
		Disable()
	Endif
Endif

EndEvent
