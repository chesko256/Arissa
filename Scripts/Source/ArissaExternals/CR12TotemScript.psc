Scriptname CR12TotemScript extends ReferenceAlias  

ReferenceAlias Property Questgiver auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if ( (GetOwningQuest() as CompanionsRadiantQuest).IsAccepted )
			Questgiver.GetActorReference().EvaluatePackage()
		endif
	endif
EndEvent
