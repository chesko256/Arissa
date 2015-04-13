Scriptname TGTQ04NoteScript extends ReferenceAlias  Conditional

Quest Property pTGTQ04Quest  Auto  Conditional
int Property pTGTQ04Once Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGTQ04Once == 0
		if NewContainer == Game.GetPlayer()
			pTGTQ04Quest.SetStage(40)
			pTGTQ04Once = 1
		endif
	endif

EndEvent
