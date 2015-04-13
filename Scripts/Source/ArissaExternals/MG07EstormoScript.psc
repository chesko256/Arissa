Scriptname MG07EstormoScript extends ReferenceAlias  

Quest Property MG07 Auto



Event OnDeath(Actor AkKiller)

	if AkKiller == Game.GetPlayer()
		if MG07.GetStage() == 60
			MG07.SetStage(70)
		endif
	endif

EndEvent