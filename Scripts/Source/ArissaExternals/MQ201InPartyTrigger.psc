Scriptname MQ201InPartyTrigger extends Trigger  
{tracks when player has left party area}

Quest Property MQ201 auto

function fireTriggerEvent()
	if IsTargetInTrigger()
		(MQ201 as MQ201QuestScript).PlayerInPartyTrigger = true
	else
		(MQ201 as MQ201QuestScript).PlayerInPartyTrigger = false
	endif
endFunction
