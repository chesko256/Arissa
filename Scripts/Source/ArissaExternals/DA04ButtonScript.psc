Scriptname DA04ButtonScript extends ObjectReference  


bool openNext = false
bool closeNext = false


Function _Open()
	openNext = false
	GoToState("Busy")
	PlayAnimationandWait("Open", "Done")
	GoToState("Opened")
EndFunction

Function _Close()
	closeNext = false
	GoToState("Busy")
	PlayAnimation("Close")
	GoToState("Closed")
EndFunction

Function Close()
EndFunction

Function Open()
EndFunction


Event OnInit()
	BlockActivation(True)
EndEvent


auto State Closed
	Event OnBeginState()
		BlockActivation(True)
		if (openNext)
			Open()
		endif
	EndEvent

	Function Open()
		_Open()
	EndFunction
EndState


State Opened
	Event OnBeginState()
		BlockActivation(False)
		if (closeNext)
			Close()
		endif
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			PlayAnimationAndWait("Trigger01", "Done")
			GoToState("Opened")
		endif
	EndEvent

	Function Close()
		_Close()
	EndFunction
EndState

; defers open and close commands
State Busy
	Function Open()
		openNext = true
	EndFunction

	Function Close()
		closeNext = true
	EndFunction
EndState
