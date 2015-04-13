Scriptname DB07CiceroMockTrigger5Script extends ObjectReference  


Quest Property DB07  Auto
Scene Property CiceroMockScene5  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene5.Start()
		Disable()
	Endif
Endif


EndEvent
