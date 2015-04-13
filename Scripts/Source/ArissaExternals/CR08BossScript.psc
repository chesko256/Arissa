Scriptname CR08BossScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	if ((GetOwningQuest() as CompanionsRadiantQuest).IsAccepted)
		GetOwningQuest().SetStage(20)
	else
		(GetOwningQuest() as CompanionsRadiantQuest).PrematureShutdown()
	endif
EndEvent
