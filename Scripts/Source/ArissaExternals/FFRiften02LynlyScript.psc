Scriptname FFRiften02LynlyScript extends ReferenceAlias  Conditional

GlobalVariable Property pLynlyDead  Auto  Conditional
Quest Property pFFRiften02Quest  Auto  

Event OnDeath(Actor akKiller)

	pLynlyDead.Value = 1

	if pFFRiften02Quest.GetStage() == 20
		pFFRiften02Quest.SetStage(30)
	endif

endEvent