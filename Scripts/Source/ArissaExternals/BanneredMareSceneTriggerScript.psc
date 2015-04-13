Scriptname BanneredMareSceneTriggerScript extends ObjectReference  

Scene Property pMikaelScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	pMikaelScene.Start()
	Disable()
Endif

EndEvent
