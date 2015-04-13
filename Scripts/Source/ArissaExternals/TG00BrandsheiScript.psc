Scriptname TG00BrandsheiScript extends ReferenceAlias  Conditional

Quest Property pTG00Quest Auto

Event OnDeath(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if (getowningquest() as TG00QuestScript).pTG00Killer == 0
			(getowningquest() as TG00QuestScript).pTG00Killer = 1
			pTG00Quest.SetStage(35)
		endif
	endif

endEvent