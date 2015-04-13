Scriptname dunKorvanjundStoryDoorFailSCRIPT extends ObjectReference Hidden 

import game
import debug

quest property myQuest1 auto	
{ quest to call SetStage on}

int property stage1 auto
{ stage to set}

quest property myQuest2 auto	
{ quest to call SetStage on}

int property stage2 auto
{ stage to set}



auto STATE waitingForActivate
	EVENT onActivate(objectReference triggerRef)
		if myQuest1.IsRunning()
			myQuest1.setStage(stage1)
			gotoState("hasBeenTriggered")
		endif
		if myQuest2.IsRunning()
			myQuest2.setStage(stage2)
			gotoState("hasBeenTriggered")
		endif		
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE