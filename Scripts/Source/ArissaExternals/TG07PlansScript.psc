Scriptname TG07PlansScript extends ObjectReference  Conditional

Quest Property pTGR07Quest Auto  

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pTGR07Quest.GetStage() == 50
			pTGR07Quest.SetStage(60)
		endif
	endif

EndEvent