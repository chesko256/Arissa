Scriptname WE100BaseLetterScript extends ObjectReference  

GlobalVariable property WE100ReadLetter auto

Event OnRead()
; 	;debug.trace(self + "OnRead() WE100ReadLetter = 1")
	
	WE100ReadLetter.SetValue(1)

EndEvent
