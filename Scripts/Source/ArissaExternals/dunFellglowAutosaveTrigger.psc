Scriptname dunFellglowAutosaveTrigger extends ObjectReference  

Auto State Ready
	EVENT onTriggerEnter(objectReference actronaut)
; 		Debug.Trace("Autosave Requested")
		Game.RequestAutoSave()	
		GoToState("Done")
	endEVENT
EndState

State Done
	EVENT onTriggerEnter(objectReference actronaut)
		; Do nothing.
	endEVENT
EndState