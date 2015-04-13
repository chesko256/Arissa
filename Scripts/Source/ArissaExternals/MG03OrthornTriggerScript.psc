Scriptname MG03OrthornTriggerScript extends ObjectReference  

Quest Property MG03  Auto  

Scene Property OrthornScene  Auto  

int DoOnce

Auto State Waiting
	Event OnActivate(ObjectReference ActionRef)
		OrthornScene.Start()
		GoToState("Done")
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference ActionRef)
		;Do Nothing
	EndEvent
EndState
