Scriptname FFRiften06PlayerScript extends ReferenceAlias  

FFR06QuestScript Property pFFR06QS Auto Conditional
MiscObject Property pGem Auto Conditional
Quest Property pFFR06Quest Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pGem)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFR06Quest.GetStageDone(20) == 1
		if akBaseItem == pGem
			pFFR06QS.GemsCounted()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFR06Quest.GetStageDone(20) == 1
		if akBaseItem == pGem
			pFFR06QS.GemsCounted()
		endif
	endif

endEvent
