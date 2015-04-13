Scriptname defaultDisableSelfOnActivate extends ObjectReference  
{for anything that you want to disable itself once it's activated}

auto STATE WaitingToBeActivated
	EVENT OnActivate (objectReference triggerRef)
		Disable()
		GoToState("Disabled")
	EndEvent
EndState

STATE Disabled
	;done doing stuff
endSTATE
