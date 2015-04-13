scriptName dunAlftandSteamPuzzleController extends objectReference
;
;
;=================================================================

objectReference Property EnableMarkerCircuit01 auto
objectReference Property EnableMarkerCircuit02 auto
objectReference Property EnableMarkerCircuit03 auto
objectReference Property EnableMarkerCircuit04 auto
objectReference Property EnableMarkerCircuit05 auto
objectReference Property EnableMarkerCircuit06 auto
objectReference Property EnableMarkerCircuit07 auto
objectReference Property EnableMarkerCircuit08 auto
objectReference Property EnableMarkerCircuit09 auto
objectReference Property EnableMarkerCircuit10 auto
objectReference Property EnableMarkerCircuit11 auto
objectReference Property EnableMarkerCircuit12 auto
objectReference Property EnableMarkerCircuit13 auto
objectReference Property EnableMarkerCircuit14 auto
objectReference Property EnableMarkerDoor auto

bool property Lever01 auto hidden
bool property Lever02 auto hidden
bool property Lever03 auto hidden
bool property Lever04 auto hidden
bool property Lever05 auto hidden
bool property Lever06 auto hidden
bool property Lever07 auto hidden
;/
event onActivate(objectReference TriggerRef)
; 	DEBUG.Trace(self + " has been triggered by " + TriggerRef)
	EvaluateLever(TriggerRef)
	EvaluateCircuit()
endEvent

function EvaluateLever (objectReference TriggerRef) ;This function reads the passed in ref to toggle the correct bool
	NorLever01SCRIPT myTrigger = (TriggerRef as NorLever01SCRIPT)
; 	DEBUG.Trace(self + " is evaluating Lever")
; 	DEBUG.TRACE("Triggering Lever = " + TriggerRef)
; 	DEBUG.Trace("LeverPosition is " + myTrigger.inPushedPosition)
	if myTrigger.PuzzleLeverNumber == 1
		Lever01 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 2
		Lever02 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 3
		Lever03 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 4
		Lever04 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 5
		Lever05 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 6
		Lever06 = myTrigger.inPushedPosition
	endif
	if myTrigger.PuzzleLeverNumber == 7
		Lever07 = myTrigger.inPushedPosition
	endif
EndFunction

Function EvaluateCircuit() ;This function sorts through the levers to turn on/off steam circuits
; 	DEBUG.Trace(self + " is evaluating Circuit")
	if Lever01 == TRUE
		EnableMarkerCircuit01.disable()
		EnableMarkerCircuit02.enable()
		If Lever02 == FALSE
			EnableMarkerCircuit03.enable()
			EnableMarkerCircuit03.activate(self)
			EnableMarkerCircuit04.disable()
			EnableMarkerCircuit05.disable()
			EnableMarkerCircuit06.disable()
			EnableMarkerCircuit07.disable()
			EnableMarkerCircuit08.disable()
			EnableMarkerCircuit09.disable()
			EnableMarkerCircuit10.disable()
			EnableMarkerCircuit11.disable()
			EnableMarkerCircuit12.disable()
			EnableMarkerCircuit13.disable()
			EnableMarkerCircuit14.disable()
		Else
			EnableMarkerCircuit03.disable()
			EnableMarkerCircuit04.enable()
			If Lever03 == TRUE
				EnableMarkerCircuit05.disable()
				EnableMarkerCircuit06.enable()
				If Lever04 == False
					EnableMarkerCircuit07.enable()
					EnableMarkerCircuit08.disable()
					EnableMarkerCircuit09.disable()
					EnableMarkerCircuit10.disable()
					EnableMarkerCircuit11.disable()
					EnableMarkerCircuit12.disable()
					EnableMarkerCircuit13.disable()
					EnableMarkerCircuit14.disable()
				Else
					EnableMarkerCircuit07.disable()
					EnableMarkerCircuit08.enable()
					If Lever05 == False
						EnableMarkerCircuit09.disable()
						EnableMarkerCircuit10.enable()
						If Lever06 == True
							EnableMarkerCircuit11.disable()
							EnableMarkerCircuit12.enable()
							If Lever07 == True
								EnableMarkerCircuit13.disable()
								EnableMarkerCircuit14.enable()
								EnableMarkerDoor.enable()
							Else
								EnableMarkerCircuit13.enable()
								EnableMarkerCircuit14.disable()
							Endif
						Else
							EnableMarkerCircuit11.enable()
							EnableMarkerCircuit12.disable()
							EnableMarkerCircuit13.disable()
							EnableMarkerCircuit14.disable()
						Endif
					Else
						EnableMarkerCircuit09.enable()
						EnableMarkerCircuit09.activate(self)
						EnableMarkerCircuit10.disable()
						EnableMarkerCircuit11.disable()
						EnableMarkerCircuit12.disable()
						EnableMarkerCircuit13.disable()
						EnableMarkerCircuit14.disable()
					Endif
				Endif
			Else
				EnableMarkerCircuit05.enable()
				EnableMarkerCircuit06.disable()
				EnableMarkerCircuit07.disable()
				EnableMarkerCircuit08.disable()
				EnableMarkerCircuit09.disable()
				EnableMarkerCircuit10.disable()
				EnableMarkerCircuit11.disable()
				EnableMarkerCircuit12.disable()
				EnableMarkerCircuit13.disable()
				EnableMarkerCircuit14.disable()
			Endif
		EndIf
	Else
		EnableMarkerCircuit01.enable()
		EnableMarkerCircuit02.disable()
		EnableMarkerCircuit03.disable()
		EnableMarkerCircuit04.disable()
		EnableMarkerCircuit05.disable()
		EnableMarkerCircuit06.disable()
		EnableMarkerCircuit07.disable()
		EnableMarkerCircuit08.disable()
		EnableMarkerCircuit09.disable()
		EnableMarkerCircuit10.disable()
		EnableMarkerCircuit11.disable()
		EnableMarkerCircuit12.disable()
		EnableMarkerCircuit13.disable()
		EnableMarkerCircuit14.disable()		
	Endif
; 	DEBUG.Trace("Lever01 = " + Lever01)
; 	DEBUG.Trace("Lever02 = " + Lever02)
; 	DEBUG.Trace("Lever03 = " + Lever03)
; 	DEBUG.Trace("Lever04 = " + Lever04)
; 	DEBUG.Trace("Lever05 = " + Lever05)
; 	DEBUG.Trace("Lever06 = " + Lever06)
; 	DEBUG.Trace("Lever07 = " + Lever07)
	
EndFunction
/;