Scriptname FFRiften07PlayerScript extends ReferenceAlias  Conditional

Quest Property pFFR07Quest Auto Conditional
Ingredient Property pTeeth Auto Conditional
FFR07QuestScript Property pFFR07QS Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pTeeth)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFR07Quest.GetStageDone(20) == 1
		if akBaseItem == pTeeth
			pFFR07QS.TeethCounted()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFR07Quest.GetStageDone(20) == 1
		if akBaseItem == pTeeth
			pFFR07QS.TeethCounted()
		endif
	endif

endEvent