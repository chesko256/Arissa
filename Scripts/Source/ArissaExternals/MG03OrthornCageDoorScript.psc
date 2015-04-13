Scriptname MG03OrthornCageDoorScript extends ObjectReference  

Quest Property MG03  Auto  


Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if isLocked()
			;do nothing
		else
			MG03.SetStage(55)
		endif
	endif

EndEvent