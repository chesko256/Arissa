Scriptname FFRiften10PlayerScript extends ReferenceAlias  Conditional

Quest Property pFFR10Quest Auto Conditional
Ingredient Property pSalt Auto Conditional
FFR10QuestScript Property pFFR10QS Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pSalt)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFR10Quest.GetStageDone(20) == 1
		if akBaseItem == pSalt
			pFFR10QS.SaltCounted()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFR10Quest.GetStageDone(20) == 1
		if akBaseItem == pSalt
			pFFR10QS.SaltCounted()
		endif
	endif

endEvent