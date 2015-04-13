Scriptname RDSTrigger02Script extends ObjectReference  Conditional

int Property pDone Auto Conditional
Quest Property pRDSQuest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDone == 0
			pRDSQuest.SetStage(10)
			pDone = 1
		endif
	endif

endEvent
