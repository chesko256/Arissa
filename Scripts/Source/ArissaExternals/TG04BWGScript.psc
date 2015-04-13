Scriptname TG04BWGScript extends ObjectReference  Conditional

Quest Property pTG04Quest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG04Quest.GetStage() < 50
			pTG04Quest.SetStage(50)
		endif
	endif

endEvent