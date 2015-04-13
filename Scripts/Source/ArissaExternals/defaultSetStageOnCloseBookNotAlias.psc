Scriptname defaultSetStageOnCloseBookNotAlias extends ObjectReference  
{SCRIPT NAME NO LONGER ACCURATE. This previously waited until the book was closed to set its stage, but was changed to match expected behavior of OnRead event.}

int Property preReqStage = -1 Auto
{OPTIONAL: If set, this stage must have been done to set the StageToSet}
int Property StageToSet Auto
{The stage to set the quest to when I've been read}
Quest property MyQuest Auto
{Quest to set the stage on.}

auto STATE ready
	Event OnActivate(ObjectReference akActionRef)
		stageHandling()
	EndEvent

	Event OnEquipped(Actor akActor)
		stageHandling()
	endEvent
	
	Event OnRead()
		stageHandling()
	EndEvent
endSTATE

STATE Done
endSTATE

;==============================================

FUNCTION stageHandling()
	If (MyQuest.GetStage() == preReqStage || preReqStage == -1)
		; utility.wait(0.1)
		MyQuest.SetStage(StageToSet)	
		gotoState("Done")
	Endif	
endFUNCTION
