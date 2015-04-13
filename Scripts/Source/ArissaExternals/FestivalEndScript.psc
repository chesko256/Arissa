Scriptname FestivalEndScript extends ObjectReference


Quest Property MS05KingOlafsFestival Auto
Int Property Stage = 200 Auto
float property minBreakdownTimer = 15.0 auto

Auto State Waiting
EndState

State Listening
	Event onBeginState()
		unRegisterForUpdate()
		registerForSingleUpdate(minBreakdownTimer)
	endEvent
	
	Event onCellAttach()
		unRegisterForUpdate()
	endEvent
	
	Event onCellDetach()
		registerForSingleUpdate(minBreakdownTimer)
	endEvent
Endstate

State Done
EndState

Event onUpdate()
	if !self.getParentCell().isAttached()
		GotoState("Done")
		MS05KingOlafsFestival.Setstage(Stage)
		unRegisterForUpdate()
	else
		registerForSingleUpdate(minBreakdownTimer)
	endIf
endEvent