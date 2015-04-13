ScriptName FreeformCidhnaMineAOnItemAdded extends ReferenceAlias

Potion Property Skooma Auto
Weapon Property MS02Shiv Auto

Event OnInit()
  AddInventoryEventFilter(Skooma)
  AddInventoryEventFilter(MS02Shiv)
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If (akBaseItem == Skooma) && (GetOwningQuest().GetStageDone(20) == 1) && (GetOwningQuest().GetStageDone(30) == 0)
		GetOwningQuest().SetStage(30)
	EndIf

	If (akBaseItem == MS02Shiv) && (GetOwningQuest().GetStageDone(10) == 1) && (GetOwningQuest().GetStageDone(40) == 0)
		GetOwningQuest().SetStage(50)
	EndIf

EndEvent 