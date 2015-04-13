Scriptname TGCrownMiscJewelScript extends ReferenceAlias  Conditional

int Property pTGCrownGemOnce Auto
Quest Property pTGCrownMiscQuest Auto
GlobalVariable Property pTGGemCountFound	Auto
Quest Property pTG02Quest Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		pTGGemCountFound.Value += 1
	endif

	if pTGGemCountFound.Value == 1
		if pTG02Quest.GetStageDone(20) == 1
			pTGCrownMiscQuest.SetStage(20)
		elseif pTG02Quest.GetStageDone(20) == 0
			pTGCrownMiscQuest.SetStage(10)
		endif
	endif
	
EndEvent