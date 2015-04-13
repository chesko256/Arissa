Scriptname TGTQ01MoldScript extends ReferenceAlias  Conditional

Quest Property pTGTQ01Quest  Auto  Conditional
int Property pTGTQ01Once Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGTQ01Once == 0
		if NewContainer == Game.GetPlayer()
			pTGTQ01Quest.SetStage(40)
			pTGTQ01Once = 1
		endif
	endif

EndEvent
