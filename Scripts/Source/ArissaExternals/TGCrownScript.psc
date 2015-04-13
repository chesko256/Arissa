Scriptname TGCrownScript extends ReferenceAlias Conditional

int Property pTGCrownOnce Auto
Quest Property pTGCrownQuest Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGCrownOnce == 0
		if NewContainer == Game.GetPlayer()
			pTGCrownQuest.SetStage(50)
			pTGCrownOnce = 1
		endif
	endif

EndEvent