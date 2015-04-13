Scriptname DRRTriggerScript extends ObjectReference  Conditional

Quest Property pDRRQuest  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDRRQuest.SetStage(10)
		endif
	endif

endEvent