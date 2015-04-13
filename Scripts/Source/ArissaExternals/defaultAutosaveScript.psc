Scriptname defaultAutosaveScript extends ObjectReference  

import game
import utility

bool property done auto hidden
bool property lazySave auto

EVENT onTriggerEnter(objectReference actronaut)
; 	;Debug.Trace("Trigger Hit")
	if done == FALSE
		while !isInMenuMode()
			waitMenuMode(0.5)
		endWhile
		done = TRUE
; 		;Debug.Trace("Autosave Requested")
		requestAutoSave()	
	endif
endEVENT

EVENT onReset()
	done = FALSE
endEVENT
