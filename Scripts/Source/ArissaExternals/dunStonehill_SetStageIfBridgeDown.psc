scriptname dunStonehill_SetStageIfBridgeDown extends defaultSetStageTrigSCRIPT
{Now used by Frostmere crypt. Adds an additional check to see if a drawbridge is down.}

ObjectReference property bridge Auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if ((bridge as default2stateactivator).isOpen == False)
			Parent.OnTriggerEnter(TriggerRef)
		EndIf
	EndEvent
endSTATE