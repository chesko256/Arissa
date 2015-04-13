Scriptname FVDQuillScript extends ReferenceAlias  Conditional

Quest Property pFVDQuest  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pFVDQuest.GetStage() == 20
			pFVDQuest.SetStage(30)
		endif
	endif

endEvent