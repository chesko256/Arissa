Scriptname DB07CiceroMockTrigger8Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene8  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene8.Start()
		Disable()
	Endif
Endif


EndEvent

