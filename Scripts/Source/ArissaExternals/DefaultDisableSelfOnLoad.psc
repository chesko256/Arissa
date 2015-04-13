Scriptname DefaultDisableSelfOnLoad extends ObjectReference  
{disable self on load after quest stage is set}

Quest Property myQuest  Auto  

int Property disableStage  Auto  

bool Property bStageMustBeDone = false Auto  
{false by default
if true, look for GetStageDone disableStage
if false, look for GetStage >= disableStage}

auto State waiting
	event OnLoad()
		if (bStageMustBeDone && myQuest.GetStageDone(disableStage)) || (!bStageMustBeDone && myQuest.GetStage() >= disableStage)
			gotoState("done")
			Disable()
		endif
	endEvent
endState

state done
; do nothing
; note: if ref is reenabled after this state is set, this script will not redisable it
endState