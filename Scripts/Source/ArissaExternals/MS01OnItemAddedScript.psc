ScriptName MS01OnItemAddedScript extends ReferenceAlias

Key Property MS01MargretKey Auto
Book Property MS01MargretJournal Auto
Key Property MS01WeylinKey Auto
Book Property MS01WeylinNote Auto
Book Property MS01NeposJournal Auto
Book Property MS01ThonarJournal Auto

Event OnInit()
	AddInventoryEventFilter(MS01MargretKey)
	AddInventoryEventFilter(MS01MargretJournal)
	AddInventoryEventFilter(MS01WeylinKey)
	AddInventoryEventFilter(MS01WeylinNote)
	AddInventoryEventFilter(MS01ThonarJournal)
	AddInventoryEventFilter(MS01NeposJournal)
EndEvent



Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If (akBaseItem == MS01MargretKey) && (GetOwningQuest().GetStageDone(30) == 1)
		GetOwningQuest().SetStage(32)
	EndIf

	If (akBaseItem == MS01MargretJournal)
		;make sure guard threatens player
		GetOwningQuest().SetStage(37)
		If (GetOwningQuest().GetStageDone(20) == 1)
			GetOwningQuest().SetStage(36)
		EndIf
	EndIf

	If (akBaseItem == MS01WeylinKey) && (GetOwningQuest().GetStageDone(40) == 1)
		GetOwningQuest().SetStage(45)
	EndIf

	If (akBaseItem == MS01WeylinNote)
		;make sure Dryston roughs up the player
		GetOwningQuest().SetStage(43)
		If (GetOwningQuest().GetStageDone(20) == 1)
			GetOwningQuest().SetStage(46)
		EndIf
	EndIf

	If (akBaseItem == MS01ThonarJournal) 
		;make sure Eltrys is dead
		GetOwningQuest().SetStage(90)
		If (GetOwningQuest().GetStageDone(38) == 1) && (GetOwningQuest().GetStageDone(70) == 0)
		  GetOwningQuest().SetStage(66)
		EndIf
	EndIf

	If (akBaseItem == MS01NeposJournal)
		GetOwningQuest().SetStage(90)
		If (GetOwningQuest().GetStageDone(48) == 1) && (GetOwningQuest().GetStageDone(80) == 0)
			GetOwningQuest().SetStage(76)
		EndIf
	EndIf

EndEvent 