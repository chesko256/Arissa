Scriptname TGRNTPlayer extends ReferenceAlias  

TGRNTQuestScript Property pTGRNTQS  Auto  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

; 	debug.trace(self + "OnItemAdded Item Taken:" + akBaseItem + "," + akItemReference)
	pTGRNTQS.SCount()

endEvent

