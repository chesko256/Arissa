scriptName Favor010DebtorScript extends ReferenceAlias

MiscObject Property Gold Auto

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If (GetOwningQuest().GetStageDone(10) == 1) && (akbaseItem == Gold) && (akDestContainer == Game.GetPlayer())
		GetOwningQuest().SetStage(15)
	EndIf
EndEvent