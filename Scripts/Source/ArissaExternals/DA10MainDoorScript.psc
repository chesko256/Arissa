ScriptName DA10MainDoorScript extends ReferenceAlias

;Event OnLoad()
;
;	If (GetOwningQuest().GetStage() < 80)
;		;Self.GetRef().Lock()
;	EndIf
;
;EndEvent

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStageDone(37) == 1 && GetOwningQuest().GetStageDone(40) == 0
		GetOwningQuest().SetStage(40)
	EndIf

EndEvent