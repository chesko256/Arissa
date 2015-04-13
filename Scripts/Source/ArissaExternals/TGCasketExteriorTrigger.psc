Scriptname TGCasketExteriorTrigger extends ObjectReference  Conditional

ObjectReference Property pLever Auto
ObjectReference Property pCasket Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pCasket.GetOpenState() == 1
		if akActionRef == Game.GetPlayer()
			pLever.Activate(Game.GetPlayer())
		endif
	endif

endEvent