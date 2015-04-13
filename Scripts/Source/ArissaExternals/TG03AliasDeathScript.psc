Scriptname TG03AliasDeathScript extends ReferenceAlias  Conditional

Event OnDeath(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if (getowningquest() as TG03QuestScript).getstage() < 100
			(getowningquest() as TG03QuestScript).setstage(150)
		endif
	endif

endEvent