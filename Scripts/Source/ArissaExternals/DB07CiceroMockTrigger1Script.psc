Scriptname DB07CiceroMockTrigger1Script extends ObjectReference  


Quest Property DB07  Auto
Scene Property CiceroMockScene1  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene1.Start()
		Disable()
	Endif
Endif


EndEvent

