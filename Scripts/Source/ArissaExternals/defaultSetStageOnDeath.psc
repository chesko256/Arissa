scriptName defaultSetStageOnDeath extends actor
{Set stage on specificed quest when this actor dies.  Pre-Requistite stage optional}

quest property myQST auto
{quest to set stage upon}
int property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int property StageToSet auto
{Set this stage when the actor dies}

auto STATE waiting
	EVENT onDeath(actor killer)
		if preReqStage == -1 || myQST.getStageDone(preReqStage) == TRUE
			myQST.setStage(stageToSet)
			gotoState("inactive")
		elseif preReqStage != -1 && myQST.getStageDone(preReqStage) == FALSE
; 			debug.trace(self + " was killed before stage " + preReqStage + " of " + myQST + " was set")
		else
; 			debug.trace(self + " got defaultSetSTageonDeath script into a bad state!")
		endif
	endEVENT
endSTATE

STATE inactive
endSTATE

