Scriptname CR04BrutePreQuestScript extends ReferenceAlias  



Event OnDeath(Actor akKiller)
	if (!(GetOwningQuest() as CompanionsRadiantQuest).IsAccepted)
		(GetOwningQuest() as CompanionsRadiantQuest).PrematureShutdown()
	endif
EndEvent
