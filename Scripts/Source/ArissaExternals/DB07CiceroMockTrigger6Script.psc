Scriptname DB07CiceroMockTrigger6Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene6  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene6.Start()
		Disable()
	Endif
Endif


EndEvent

