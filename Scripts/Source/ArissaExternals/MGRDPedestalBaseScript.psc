Scriptname MGRDPedestalBaseScript extends ObjectReference  


Event OnActivate (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if (Game.GetPlayer().GetActorValue("Destruction") < 100)
			;do nothing
		endif
	endif



EndEvent