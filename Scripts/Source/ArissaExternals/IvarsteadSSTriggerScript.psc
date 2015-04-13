Scriptname IvarsteadSSTriggerScript extends ObjectReference  

int Property pDone Auto Conditional
Quest Property pIVSSQuest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDone == 0
			pIVSSQuest.SetStage(10)
			pDone = 1
		endif
	endif

endEvent