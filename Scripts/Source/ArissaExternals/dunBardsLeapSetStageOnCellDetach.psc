scriptName dunBardsLeapSetStageOnCellDetach extends objectReference
{Set stage on specificed quest when this actor dies.  Pre-Requistite stage optional}

quest property dunBardsLeapSummitQST auto
{quest to set stage upon}

int property StageToSet = 100 auto
{Set this stage when unloaded
	default = 100}

auto STATE waiting
	EVENT onCellDetach()
		if dunBardsLeapSummitQST.isRunning()
			dunBardsLeapSummitQST.setStage(StageToSet)
		endIf
	endEVENT
	
	Event onCellAttach()
		if !dunBardsLeapSummitQST.isRunning()
			dunBardsLeapSummitQST.setStage(0)
		endif
	endEvent
endSTATE

state Done
endState


