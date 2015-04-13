Scriptname PangeasFluteScirpt extends ReferenceAlias  

Event OnContainerChanges(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(40)
	EndIf
EndEvent