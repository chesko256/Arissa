Scriptname TG03SabjornLetterScript Extends ReferenceAlias Conditional

Quest Property pTG03Quest  Auto  Conditional
int Property pTG03Once Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTG03Once == 0
		if NewContainer == Game.GetPlayer()
			pTG03Quest.SetStage(100)
			pTG03Once = 1
		endif
	endif

EndEvent
