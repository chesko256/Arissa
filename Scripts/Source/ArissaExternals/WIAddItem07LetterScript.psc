Scriptname WIAddItem07LetterScript extends ReferenceAlias  

Event OnRead()
; 	debug.trace(self + "OnRead()")
	GetOwningQuest().setStage(10)

EndEvent
