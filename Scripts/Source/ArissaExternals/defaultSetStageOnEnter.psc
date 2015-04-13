Scriptname defaultSetStageOnEnter extends defaultOnEnter  conditional
{sets a quest stage when the specified ref or refs are in the trigger
}

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

;total targets currently in the trigger
int targetCountCurrent

;how many targets are we looking for? When targetCountCurrent reaches this, we trigger
int targetCountTotal

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	myQuest.setStage(stage)
	parent.TriggerMe()
endFunction
