Scriptname DB07CiceroMockTrigger4Script extends ObjectReference  


Quest Property DB07  Auto
Scene Property CiceroMockScene4  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene4.Start()
		Disable()
	Endif
Endif


EndEvent
