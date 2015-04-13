Scriptname DB07CiceroMockTrigger9Script extends ObjectReference  

Quest Property DB07  Auto
Scene Property CiceroMockScene9  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		CiceroMockScene9.Start()
		Disable()
	Endif
Endif


EndEvent

