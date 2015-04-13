scriptName dunValtheimSetStageOnUnload extends objectReference
{Set stage on specificed quest when this actor dies.  Pre-Requistite stage optional}

quest property dunValtheimKeepQST auto
{quest to set stage upon}

int property StageToSet = 100 auto
{Set this stage when unloaded
	default = 100}

auto STATE waiting
	EVENT onCellDetach()
		if dunValtheimKeepQST.isRunning()
			dunValtheimKeepQST.setStage(StageToSet)
		endIf
	endEVENT
endSTATE

STATE inactive
	event onReset()
		goToState("waiting")
	endEvent
endSTATE
