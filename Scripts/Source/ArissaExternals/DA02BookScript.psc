Scriptname DA02BookScript extends ObjectReference  
{Script on the DA02Book base object}

GlobalVariable Property DA02MinLevel Auto

Quest Property DA02 Auto
Quest Property WEDA02 Auto



Event OnCellLoad()

	if Game.GetPlayer().GetLevel() >= DA02MinLevel.GetValue()
; 		debug.trace(self + "OnCellLoad() player is appropriate level. Calling ENABLE()")
		enable()
	
	Else
; 		debug.trace(self + "OnCellLoad() player is NOT appropriate level. Calling DISABLE()")
		disable()
	
	EndIf

EndEvent

Event OnRead()
	
; 	debug.trace(self + "OnRead()")
 
 	if DA02.GetStage() < 1 || (DA02 as DA02Script).Stage < 1
		DA02.setStage(1)
		WEDA02.stop()
	EndIf
 EndEvent
 
 