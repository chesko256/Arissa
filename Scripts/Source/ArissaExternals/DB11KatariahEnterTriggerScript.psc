Scriptname DB11KatariahEnterTriggerScript extends ObjectReference  

Quest Property DB11  Auto 

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB11.GetStage()==15)
		DB11.SetStage(20)
		Disable()
	Endif
Endif

EndEvent
