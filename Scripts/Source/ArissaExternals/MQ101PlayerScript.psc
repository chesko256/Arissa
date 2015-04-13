ScriptName MQ101PlayerScript extends ReferenceAlias

Key Property MQ101KeepDoorKey Auto
ImageSpaceModifier Property PlayerAlduinIMOD Auto

Event OnInit()
	AddInventoryEventFilter(MQ101KeepDoorKey)
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If GetOwningQuest().GetCurrentStageID() >= 200
		GetOwningQuest().SetStage(252)
	EndIf

EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If (akBaseItem == MQ101KeepDoorKey) && (GetOwningQuest().GetStageDone(260) == 0)
		GetOwningQuest().SetStage(260)
	EndIf

EndEvent 

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	;tell player how to ready a weapon
	if akBaseObject as Weapon
		; JTW - since the player still has weapons by default, this fires much sooner than expected -- when the code does InitDefaultWorn for the player.
		; Eventually the default player shouldn't have weapons, but a safety check on the quest stage already being 200 or so should resolve it for now.
		If GetOwningQuest().GetCurrentStageID() >= 200
			GetOwningQuest().SetStage(258)
		EndIf
	endIf

	If Game.GetPlayer().GetEquippedItemType(0) > 0
		If GetOwningQuest().GetCurrentStageID() >= 200
			GetOwningQuest().SetStage(256)
		EndIf
	EndIf

EndEvent