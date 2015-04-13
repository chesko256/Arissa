Scriptname MS10BloodHorkerOrdersScript extends ReferenceAlias  



Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if (!GetOwningQuest().GetStageDone(40))
			GetOwningQuest().SetStage(40)
		endif
	endif
EndEvent

Event OnRead()
	if (!GetOwningQuest().GetStageDone(40))
		GetOwningQuest().SetStage(40)
	endif
EndEvent

