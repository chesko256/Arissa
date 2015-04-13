ScriptName DA07PamphletScript extends ReferenceAlias

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStageDone(5) == 0
		GetOwningQuest().SetStage(5)
	EndIf
	
EndEvent

Event OnEquipped(Actor akActor)

	If akActor == Game.GetPlayer()
		if GetOwningQuest().GetStageDone(5) == 0
			GetOwningQuest().SetStage(5)
		EndIf
	EndIf
 
EndEvent
