Scriptname CW02RikkeGalmarMoveToScript extends ReferenceAlias  

Event OnCellDetach()
; Debug.Trace(self + "OnCellDetach()") 
	quest myQuest = GetOwningQuest()

   if myQuest.getStageDone(30) == 1 && myQuest.getStageDone(40) == 0
; 	Debug.Trace(self + "OnCellDetach() calling setStage(40).") 
	myQuest.setStage(40)
EndIf

endEvent

Event OnDetachedFromCell()
; 		Debug.Trace(self + "OnDetachedFromCell()") 

	quest myQuest = GetOwningQuest()

    if myQuest.getStageDone(30) == 1 && myQuest.getStageDone(40) == 0
; 		Debug.Trace(self + "OnDetachedFromCell() calling setStage(40).") 
		myQuest.setStage(40)
	EndIf

endEvent






