Scriptname TG04FirebrandCaseScript extends ReferenceAlias  Conditional

Quest Property pTG04Quest Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pTG04Quest.GetStageDone(36) == 0
			pTG04Quest.SetStage(36)
		endif
	endif

endEvent