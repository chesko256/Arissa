Scriptname FFRiften01TriggerScript extends ObjectReference  

Quest Property pFreeformRiften01 Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pFreeformRiften01.GetStage() == 20
		pFreeformRiften01.SetStage(30)
	endif

endEvent