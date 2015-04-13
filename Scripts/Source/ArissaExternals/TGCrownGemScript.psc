Scriptname TGCrownGemScript extends ReferenceAlias  Conditional

Quest Property pTGCrownQuest Auto
GlobalVariable Property pTGGemCountFound	Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		pTGGemCountFound.Value += 1
	endif

	if pTGGemCountFound.Value >= 24
		if pTGCrownQuest.GetStageDone(30) == 0
			pTGCrownQuest.SetStage(30)
		endif
	endif
	
EndEvent