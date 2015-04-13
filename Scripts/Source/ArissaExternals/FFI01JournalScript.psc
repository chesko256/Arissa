Scriptname FFI01JournalScript extends ReferenceAlias  

Quest Property pFFI01Quest Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pFFI01Quest.GetStage() == 20
			pFFI01Quest.SetStage(30)
		endif
	endif

endEvent