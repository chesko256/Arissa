Scriptname Ms11InsideHjerimBasement extends ObjectReference  

Quest Property ms11 Auto
ReferenceAlias Property Viola auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (ms11.IsRunning())
			(ms11 as MS11QuestScript).PlayerHasFoundHorridRoom = true
			Viola.GetActorReference().EvaluatePackage()
			Disable()
		endif
	endif
endEvent