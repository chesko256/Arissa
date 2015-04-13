Scriptname Favor055PrisonerScript extends ReferenceAlias  

Quest Property Favor055  Auto  


Event OnDeath (Actor Killer)

	if Killer == Game.GetPlayer()
		if Favor055.GetStage() == 10
			Favor055.SetStage(15)
		endif
	endif

EndEvent