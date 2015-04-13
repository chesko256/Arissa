Scriptname DRMSTrigger01Script extends ObjectReference  Conditional

int Property pDone Auto Conditional
Quest Property pDRMSQuest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDone == 0
			pDRMSQuest.SetStage(10)
			pDone = 1
		endif
	endif

endEvent
