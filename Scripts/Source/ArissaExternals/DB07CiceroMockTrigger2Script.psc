Scriptname DB07CiceroMockTrigger2Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene2  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene2.Start()
		Disable()
	Endif
Endif


EndEvent
