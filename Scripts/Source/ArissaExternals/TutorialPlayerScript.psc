ScriptName TutorialPlayerScript extends ReferenceAlias

ReferenceAlias Property QuestGiver Auto

Event OnUpdateGameTime()

	if (Game.GetPlayer().GetCurrentLocation() != QuestGiver.GetActorRef().GetCurrentLocation())
			GetOwningQuest().SetStage(100)
	EndIf

endEvent