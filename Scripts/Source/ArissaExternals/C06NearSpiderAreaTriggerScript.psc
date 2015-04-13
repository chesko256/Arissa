Scriptname C06NearSpiderAreaTriggerScript extends ObjectReference  

Quest Property C06 auto
ReferenceAlias Property Farkas auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(C06 as C06QuestScript).FarkasFGBeforeSpiders = true
		Farkas.GetActorReference().EvaluatePackage()
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	; if (akActivator == Game.GetPlayer())
	; 	(C06 as C06QuestScript).FarkasFGBeforeSpiders = false
	; 	Farkas.GetActorReference().EvaluatePackage()
	; endif
EndEvent

