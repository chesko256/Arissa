ScriptName DA10RustyMaceScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == 50
		GetOwningQuest().SetStage(60)
	EndIf

EndEvent