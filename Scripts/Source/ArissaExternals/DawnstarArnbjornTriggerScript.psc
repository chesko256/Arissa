Scriptname DawnstarArnbjornTriggerScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==20)
		DB07.SetStage(25)
		Disable()
	Endif
Endif

EndEvent

Quest Property DB07  Auto  
