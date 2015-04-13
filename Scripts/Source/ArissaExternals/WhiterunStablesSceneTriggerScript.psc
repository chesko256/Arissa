Scriptname WhiterunStablesSceneTriggerScript extends ObjectReference  

Scene Property pStablesScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	pStablesScene.Start()
	Disable()
Endif

EndEvent

