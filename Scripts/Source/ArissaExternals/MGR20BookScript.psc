Scriptname MGR20BookScript extends ReferenceAlias  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if GetOwningQuest().GetStage() == 10
			GetOwningQuest().SetStage(20)
		endif
	endif


EndEvent