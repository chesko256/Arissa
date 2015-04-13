Scriptname FFRiften20SarthisScript extends ReferenceAlias  Conditional

Quest Property pFFR20  Auto  

Event OnDeath(Actor akKiller)

	if pFFR20.GetStage() < 50
		pFFR20.SetStage(50)
	endif

endEvent