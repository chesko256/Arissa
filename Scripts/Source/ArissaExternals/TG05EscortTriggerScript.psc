Scriptname TG05EscortTriggerScript extends ObjectReference  

Quest Property pTG05Quest  Auto  


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG05Quest.GetStage() < 40
			pTG05Quest.SetStage(40)
		endif
	endif

endEvent