ScriptName RelationshipObjectionLetterScript extends ReferenceAlias

Event OnEquipped(Actor akActor)

	If akActor == Game.GetPlayer()
		If GetOwningQuest().GetStage() == 10
			;GetOwningQuest().SetStage(20)
		EndIf
	EndIf
 
EndEvent
