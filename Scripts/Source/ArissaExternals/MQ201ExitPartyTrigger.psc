Scriptname MQ201ExitPartyTrigger extends Trigger  
{tracks when player has left party area}

Quest Property MQ201 auto

function fireTriggerEvent()
	if IsTargetInTrigger()
		(MQ201 as MQ201QuestScript).PlayerInExitPartyTrigger = true
	else
		(MQ201 as MQ201QuestScript).PlayerInExitPartyTrigger = false
	endif
endFunction