Scriptname TG07ValdDebtScript extends ReferenceAlias  Conditional

int Property pTG07Taken  Auto  Conditional
Quest Property pTG07Quest  Auto  Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pTG07Taken == 0
			pTG07Quest.SetStage(47)
			pTG07Taken = 1
		endif
	endif

endevent
