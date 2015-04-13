Scriptname DB07CiceroMockTrigger7Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene7  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene7.Start()
		Disable()
	Endif
Endif


EndEvent

