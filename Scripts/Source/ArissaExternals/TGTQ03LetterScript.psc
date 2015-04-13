Scriptname TGTQ03LetterScript extends ReferenceAlias  Conditional

Quest Property pTGTQ03Quest  Auto  Conditional
int Property pTGTQ03Once Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGTQ03Once == 0
		if NewContainer == Game.GetPlayer()
			pTGTQ03Quest.SetStage(30)
			pTGTQ03Once = 1
		endif
	endif

EndEvent
