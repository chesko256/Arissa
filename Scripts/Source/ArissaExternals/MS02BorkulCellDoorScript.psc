ScriptName MS02BorkulCellDoorScript Extends ReferenceAlias

Event OnOpen(ObjectReference akActionRef)
	If GetOwningQuest().GetStage() == 30
		GetOwningQuest().SetStage(40)
	EndIf
EndEvent