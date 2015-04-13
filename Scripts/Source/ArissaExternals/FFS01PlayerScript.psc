Scriptname FFS01PlayerScript extends ReferenceAlias  

FFSareth01QuestScript Property pFFS01QS Auto Conditional
Ingredient Property pFFS01JazBay Auto Conditional
Quest Property pFFS01Quest Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pFFS01JazBay)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFS01Quest.GetStage() >= 20
		if akBaseItem == pFFS01JazBay
			pFFS01QS.GrapesCounted()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFS01Quest.GetStage() >= 20
		if akBaseItem == pFFS01JazBay
			pFFS01QS.GrapesCounted()
		endif
	endif

endEvent