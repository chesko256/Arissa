Scriptname RDSTriggerScript extends ObjectReference  Conditional

int Property pDone Auto Conditional
Quest Property pRDSQuest  Auto  Conditional
Quest Property pDRGGQuest Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDone == 0
			pRDSQuest.SetStage(10)
			pDRGGQuest.SetStage(200)
			pDone = 1
		endif
	endif

endEvent

