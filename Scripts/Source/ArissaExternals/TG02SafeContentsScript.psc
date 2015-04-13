Scriptname TG02SafeContentsScript extends ReferenceAlias  Conditional

int Property pTG02Taken  Auto  Conditional
Quest Property pTG02Quest  Auto  Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pTG02Taken == 0
			TG02QuestScript pTG02Script = pTG02Quest as TG02QuestScript
			pTG02Script.pTG02JobDone = pTG02Script.pTG02JobDone + 1
			pTG02Quest.SetObjectiveCompleted (50, 1)
			if pTG02Quest.IsObjectiveDisplayed(48) == 1
				pTG02Quest.SetObjectiveDisplayed (48,0)
			endif			
			pTG02Taken = 1
		endif
	endif

endevent