Scriptname MQ302CouncilChairScript extends ObjectReference  
{to block follower activation during MQ302}

Event OnLoad()
	if MQ302.IsRunning()
		SetNoFavorAllowed()
	else
		SetNoFavorAllowed(false)
	endif
EndEvent

Quest Property MQ302  Auto  
