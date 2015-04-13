Scriptname MS12IngredientAliasScript extends ReferenceAlias  


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (Game.GetPlayer() == akNewContainer)
		if (GetOwningQuest().GetStage() >= 30)
			(GetOwningQuest() as MS12bQuestScript).GotIngredient(GetReference())
		endif
	endif
EndEvent
