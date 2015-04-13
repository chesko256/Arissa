Scriptname TG07MercerHouseTriggerScript extends ObjectReference  Conditional

Quest Property pTG07Quest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG07Quest.GetStage() >= 40 && pTG07Quest.GetStage() < 50
			pTG07Quest.SetStage(50)
		endif
	endif

endEvent