Scriptname FreeformMorthalBGormScript extends ReferenceAlias  

Quest Property FreeformMorthalB  Auto  


Event OnDeath(Actor Killer)

	if FreeFormMorthalB.GetStage() < 20 
		FreeFormMorthalB.SetStage(255)
	endif

EndEvent