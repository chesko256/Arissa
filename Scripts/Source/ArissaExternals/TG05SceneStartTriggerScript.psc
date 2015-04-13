Scriptname TG05SceneStartTriggerScript extends ObjectReference  Conditional

Quest Property pTG05Quest  Auto  
int Property pTG05TrigDone  Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG05TrigDone == 0
			pTG05Quest.SetStage(50)
			pTG05TrigDone = 1
		endif
	endif

endEvent
