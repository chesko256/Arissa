Scriptname MS10MoveAdelaisaOnTrigger extends ObjectReference  

ReferenceAlias Property Adelaisa auto ; on MS10
ObjectReference Property TargetSpot auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (Adelaisa.GetOwningQuest().GetStage() == 70)
			Adelaisa.GetReference().MoveTo(TargetSpot)
		endif
	endif
EndEvent
