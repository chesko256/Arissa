Scriptname C00TrainingAreaTriggerScript extends ObjectReference  

Quest Property TrainingQuest auto
ReferenceAlias Property Vilkas auto ; on training quest


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
	
	if (TrainingQuest.IsRunning())
		Vilkas.GetActorReference().EvaluatePackage()
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif

	if (TrainingQuest.IsRunning())
		Vilkas.GetActorReference().EvaluatePackage()
	endif
EndEvent
