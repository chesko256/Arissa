Scriptname DB10NazirTriggerScript extends ObjectReference  

Quest Property DB10  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==30)
		;DB10.SetStage(40)
		Disable()
	Endif
Endif

EndEvent
