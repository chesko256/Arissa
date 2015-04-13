Scriptname FFRiften08BookScript extends ReferenceAlias  Conditional

Quest Property pFFR08 Auto  

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pFFR08.GetStage() >= 20
			pFFR08.SetStage(30)
		endif
	endif

EndEvent