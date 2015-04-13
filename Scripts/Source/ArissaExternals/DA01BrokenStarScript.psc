ScriptName DA01BrokenStarScript extends ReferenceAlias

Event OnLoad()

	Self.GetRef().SetNoFavorAllowed()

EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akNewContainer == Game.GetPlayer()
		If GetOwningQuest().GetStageDone(10) == 1
			GetOwningQuest().SetStage(50)
		Else
			GetOwningQuest().SetStage(15)
		EndIf
	EndIf

EndEvent