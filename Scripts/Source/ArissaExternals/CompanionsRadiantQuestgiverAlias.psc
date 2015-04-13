Scriptname CompanionsRadiantQuestgiverAlias extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	if ((GetOwningQuest() as CompanionsRadiantQuest).IsAccepted)
		GetOwningQuest().SetStage(250)
	else
		(GetOwningQuest() as CompanionsRadiantQuest).PrematureShutdown()
	endif
EndEvent
