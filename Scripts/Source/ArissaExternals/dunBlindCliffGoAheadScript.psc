Scriptname dunBlindCliffGoAheadScript extends ObjectReference  
{Move markers up to keep AI on a more intelligent-seeming path}

objectReference property GoalMarker auto
objectReference property myNPC auto

keyword property GoalLink auto

quest property myQuest auto
int property preReqStage auto

auto STATE ready
	EVENT onTriggerEnter(ObjectReference actronaut)
		advanceGoal()
	endEVENT
	
	EVENT onActivate(objectReference actronaut)
		advanceGoal()
	endEVENT
endSTATE

STATE inactive
	; nothing happens here
endSTATE

FUNCTION advanceGoal()
	if myQuest.getStage() >= preReqStage
		GoalMarker.moveTo(self.getLinkedRef(GoalLink))
		(myNPC as actor).evaluatePackage()
		gotoState("inactive")
	endif
endFUNCTION
