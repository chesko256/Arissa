Scriptname FFRiften20TriggerScript extends ObjectReference  Conditional

Quest Property pFFRiften20Quest  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pFFRiften20Quest.GetStage() == 30
			pFFRiften20Quest.SetStage(40)
		endif
	endif

endEvent