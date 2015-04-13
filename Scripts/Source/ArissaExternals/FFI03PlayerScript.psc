Scriptname FFI03PlayerScript extends ReferenceAlias  Conditional

FFI03QuestScript Property pFFI03QS Auto Conditional
FormList Property pFFI03FormList Auto Conditional
Quest Property pFFI03Quest Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pFFI03FormList)

EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFI03Quest.GetStageDone(20) == 1
		if pFFI03FormList.HasForm(akBaseItem)
			pFFI03QS.PeltsCounted()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFI03Quest.GetStageDone(20) == 1
		if pFFI03FormList.HasForm(akBaseItem)
			pFFI03QS.PeltsCounted()
		endif
	endif

endEvent