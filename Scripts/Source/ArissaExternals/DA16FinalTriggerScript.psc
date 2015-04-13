Scriptname DA16FinalTriggerScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  Conditional


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDA16Quest.GetStage() == 180
			pDA16Quest.SetStage(190)
		endif
	endif

endEvent