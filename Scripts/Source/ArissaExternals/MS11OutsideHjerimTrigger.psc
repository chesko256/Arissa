Scriptname MS11OutsideHjerimTrigger extends ReferenceAlias  


Event OnTriggerEnter(ObjectReference akActivator)
	if (GetOwningQuest().GetStageDone(10))
		GetOwningQuest().SetStage(50)
	endif
EndEvent
