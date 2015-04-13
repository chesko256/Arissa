Scriptname defaultUnlockOnLoad extends ObjectReference  
{unlocks on load, after a specified quest stage is set
}

Quest Property myQuest  Auto  
{quest to check stage against}

int Property unlockStage  Auto  
{unlock on load after this stage is set}


event OnLoad()
	if myQuest.GetStageDone(unlockStage)
		Lock(false)
	endif
endEvent