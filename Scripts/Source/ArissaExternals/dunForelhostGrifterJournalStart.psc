scriptName dunForelhostGrifterJournalStart extends referenceAlias
;
;
;================================================================

scene property myScene auto
objectReference property myJournal auto


auto state waitingForItem
	event onItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if akItemReference == myJournal
			myScene.start()
			goToState("doNothing")
		endif
	endEvent
endState

state doNothing
endState

event onInit()
	AddInventoryEventFilter(myJournal)
endEvent
