Scriptname pDB06GaiusSceneTriggerScript extends ObjectReference  

Quest Property DB06  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB06.GetStage()==10)
		pGaiusScene.Start()
		Disable()
	Endif
Endif

EndEvent


Scene Property pGaiusScene  Auto  
