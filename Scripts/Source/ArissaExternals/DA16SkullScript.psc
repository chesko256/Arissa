Scriptname DA16SkullScript extends ReferenceAlias  Conditional

Quest Property pDA16Quest  Auto  Conditional

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if pDA16Quest.GetStage() >= 198
			pDA16Quest.SetObjectiveCompleted(190,1)
			pDA16Quest.SetStage(200)
		endif
	endif

EndEvent
