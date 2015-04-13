Scriptname AventusSacramentTriggerScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	pAventusSacramentScene.Start()
	Disable()
Endif

EndEvent


Scene Property pAventusSacramentScene  Auto  
