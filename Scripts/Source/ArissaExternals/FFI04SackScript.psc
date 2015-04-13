Scriptname FFI04SackScript extends ReferenceAlias  

Quest Property pFFI04Quest Auto
ObjectReference Property pFFI04Chest  Auto  Conditional
GlobalVariable Property pFFI04Planted  Auto  Conditional

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pFFI04Quest.GetStage() == 20
		if pFFI04Quest.IsObjectiveDisplayed(10) == 1
			if NewContainer == pFFI04Chest
				pFFI04Quest.SetObjectiveCompleted(10,1)
				pFFI04Quest.SetObjectiveDisplayed(20,1)
				pFFI04Planted.Value = 1
			endif			
		endif
	endif

	if pFFI04Quest.GetStage() == 20
		if pFFI04Quest.IsObjectiveDisplayed(20) == 1
			if NewContainer == Game.GetPlayer()
				pFFI04Quest.SetObjectiveCompleted(10,0)
				pFFI04Quest.SetObjectiveDisplayed(10,1)
				pFFI04Quest.SetObjectiveDisplayed(20,0)
				pFFI04Planted.Value = 0
			endif			
		endif
	endif

EndEvent