Scriptname DB07CiceroMockTrigger3Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene3  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene3.Start()
		Disable()
	Endif
Endif


EndEvent

