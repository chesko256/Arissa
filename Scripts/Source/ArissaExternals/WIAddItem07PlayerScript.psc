Scriptname WIAddItem07PlayerScript extends ReferenceAlias  

;FILTERED BY AddInventoryEventFilter() in WIAdditem07Script's OnStoryAddToPlayer() event

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
; 	debug.trace(self + "OnItemAdded")

	(GetOwningQuest() as WIAddItem07Script).setItemCount()
	
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
; 	debug.trace(self + "OnItemRemoved")

	(GetOwningQuest() as WIAddItem07Script).setItemCount()

EndEvent

