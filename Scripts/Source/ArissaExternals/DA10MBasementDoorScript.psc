ScriptName DA10MBasementDoorScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStageDone(30) == 1 && GetOwningQuest().GetStageDone(35) == 0
		GetOwningQuest().SetStage(35)
	EndIf

EndEvent



Event OnOpen(ObjectReference akActionRef)

	If GetOwningQuest().GetStageDone(40) == 0
		GetOwningQuest().SetStage(40)
	EndIf

EndEvent