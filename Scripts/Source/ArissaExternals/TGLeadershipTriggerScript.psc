Scriptname TGLeadershipTriggerScript extends ObjectReference  Conditional

Quest Property pTGLeadQuest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTGLeadQuest.GetStage() == 20
			pTGLeadQuest.SetStage(30)
		endif
	endif

endEvent