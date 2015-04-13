Scriptname WhiterunBraithLarsFightTriggerScript extends ObjectReference  

Scene Property pKidFightScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	pKidFightScene.Start()
	Disable()
Endif

EndEvent
