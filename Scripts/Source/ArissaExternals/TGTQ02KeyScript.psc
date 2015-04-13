Scriptname TGTQ02KeyScript extends ReferenceAlias  Conditional

Quest Property pTGTQ02Quest Auto  

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pTGTQ02Quest.GetStage() < 25
			pTGTQ02Quest.SetStage(25)
		endif
	endif

EndEvent