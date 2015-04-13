Scriptname T02DinyaStopPrayingScript extends ObjectReference  


ReferenceAlias Property Dinya auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Dinya.GetActorReference().EvaluatePackage()
	endif
EndEvent
