Scriptname FFWCLetterScript extends ReferenceAlias  

Quest Property FFWC  Auto  


Event OnContainerChanged (ObjectReference NewContainer, ObjectReference OldContainer)


	if NewContainer == Game.GetPlayer()
		if FFWC.GetStage() < 30
			FFWC.SetStage(30)
		endif
	endif

EndEvent