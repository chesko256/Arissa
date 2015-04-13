Scriptname TG04StealthTrigger extends ObjectReference  

Quest Property pTG04Quest Auto Conditional
ReferenceAlias Property pGulum Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG04Quest.GetStage() == 40
			pTG04Quest.SetStage(42)
			pGulum.GetActorRef().EvaluatePackage()
			Self.Disable()
		endif
	endif

endEvent