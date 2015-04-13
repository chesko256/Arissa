Scriptname T03EldergleamSaplingScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if ((GetOwningQuest().GetStage() >= 50) && (GetOwningQuest().GetStage() < 70) )
			GetOwningQuest().SetStage(75)
		endif
	endif
EndEvent
