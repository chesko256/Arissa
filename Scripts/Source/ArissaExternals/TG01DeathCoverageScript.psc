Scriptname TG01DeathCoverageScript extends ReferenceAlias  Conditional

int Property pStage Auto Conditional

Event OnDeath(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if (getowningquest() as TG01QuestScript).getstage() < 50
			(getowningquest() as TG01QuestScript).setstage(pStage)
		endif
	endif

endEvent