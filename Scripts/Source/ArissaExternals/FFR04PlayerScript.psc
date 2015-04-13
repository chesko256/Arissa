Scriptname FFR04PlayerScript extends ReferenceAlias  

FFR04QuestScript Property pFFR04QS Auto Conditional
Ingredient Property pNirn Auto Conditional
Ingredient Property pDeathbell Auto Conditional
Ingredient Property pNightshade Auto Conditional
Quest Property pFFR04Quest Auto Conditional

Event OnInit()

	AddInventoryEventFilter(pNirn)
	AddInventoryEventFilter(pDeathbell)
	AddInventoryEventFilter(pNightshade)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(30) == 0
			if akBaseItem == pNirn
				pFFR04QS.NirnCount()
			endif
		endif
	endif

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(50) == 0
			if akBaseItem == pDeathbell
				pFFR04QS.DeathbellCount()
			endif
		endif
	endif

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(40) == 0
			if akBaseItem == pNightshade
				pFFR04QS.NightshadeCount()
			endif
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(30) == 0
			if akBaseItem == pNirn
				pFFR04QS.NirnCount()
			endif
		endif
	endif

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(50) == 0
			if akBaseItem == pDeathbell
				pFFR04QS.DeathbellCount()
			endif
		endif
	endif

	if pFFR04Quest.GetStageDone(20) == 1
		if pFFR04Quest.GetStageDone(40) == 0
			if akBaseItem == pNightshade
				pFFR04QS.NightshadeCount()
			endif
		endif
	endif

endEvent