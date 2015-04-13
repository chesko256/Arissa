Scriptname TGRGFItemToGetScript extends ReferenceAlias  Conditional

Quest Property pTGRGF Auto  
ReferenceAlias Property pTGRGFMarkAlias Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pTGRGF.GetStage() < 50
			pTGRGF.SetStage(50)
		endif
	endif

EndEvent