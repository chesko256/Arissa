Scriptname TG09PostExitTriggerScript extends ObjectReference  Conditional

Quest Property pTG09Post Auto Conditional
int Property pFinished Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTG09Post.GetStage() >= 20
		if pFinished == 0
			if akActionRef == Game.GetPlayer()
				pTG09Post.SetStage(30)
				pFinished = 1
			endif
		endif
	endif

endEvent