Scriptname WhiterunAmrenSceneTriggerScript extends ObjectReference  

Scene Property pAmrenSaffirScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
; 	debug.trace("Player has entered Amren's trigger, run scene")
	pAmrenSaffirScene.Start()
	Disable()
Endif

EndEvent


