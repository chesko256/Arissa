Scriptname FFR18PlayerAliasScript extends ReferenceAlias  

Quest Property pFFR18Quest Auto Conditional
MiscObject Property pGem Auto Conditional
MiscObject Property pTusk Auto Conditional
MiscObject Property pOre Auto Conditional
FFR18QuestScript Property pFFR18QS Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pGem)
	AddInventoryEventFilter(pTusk)
	AddInventoryEventFilter(pOre)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(30) == 0
			if akBaseItem == pGem
				pFFR18QS.GemCounted()
			endif
		endif
	endif

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(40) == 0
			if akBaseItem == pTusk
				pFFR18QS.TuskCounted()
			endif	
		endif
	endif

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(50) == 0
			if akBaseItem == pOre
				pFFR18QS.OreCounted()
			endif
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(30) == 0
			if akBaseItem == pGem
				pFFR18QS.GemCounted()
			endif
		endif
	endif

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(40) == 0
			if akBaseItem == pTusk
				pFFR18QS.TuskCounted()
			endif
		endif
	endif

	if pFFR18Quest.GetStageDone(20) == 1
		if pFFR18Quest.GetStageDone(50) == 0
			if akBaseItem == pOre
				pFFR18QS.OreCounted()
			endif
		endif
	endif

endEvent