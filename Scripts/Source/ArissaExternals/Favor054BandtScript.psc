Scriptname Favor054BandtScript extends ReferenceAlias  

Quest Property Favor054  Auto  


Event OnDeath (Actor Killer)

	if Killer == Game.GetPlayer()
		if Favor054.GetStage() == 10
			Favor054.SetStage(15)
		endif
	endif

EndEvent