Scriptname C02KickerTriggerScript extends ReferenceAlias  



Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		GetOwningQuest().SetStage(200) ;Stop()
	endif
EndEvent

