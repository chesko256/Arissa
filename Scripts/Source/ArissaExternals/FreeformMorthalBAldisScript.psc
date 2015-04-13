Scriptname FreeformMorthalBAldisScript   extends ReferenceAlias

Quest Property FreeformMorthalB  Auto  


Event OnDeath(Actor Killer)

	if FreeformMorthalB.GetStage() < 20
		FreeformMorthalB.SetStage(255)
	endif

EndEvent