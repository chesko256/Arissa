Scriptname TGRSLItemToGetScript extends ReferenceAlias Conditional

Quest Property pTGRSLQuest  Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pTGRSLQuest.GetStage() < 50
			pTGRSLQuest.SetStage(50)
		endif
	endif

EndEvent