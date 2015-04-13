Scriptname DA16LabTriggerScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDA16Quest.GetStage() == 90
			pDA16Quest.SetStage(100)
		endif
	endif

endEvent