Scriptname MG05SavosArenScript extends ReferenceAlias  

Quest Property MG05  Auto  


Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MG05.GetStage() == 20
			MG05.SetStage(25)
		endif
	endif

EndEvent