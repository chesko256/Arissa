scriptName dunMarkarthWizardPlateSystemManager extends ObjectReference
{Bi-directional pressure plate system manager.}

ObjectReference property PressurePlate1 Auto
ObjectReference property PressurePlate2 Auto
ObjectReference property PressurePlate3 Auto
ObjectReference property PressurePlate4 Auto
ObjectReference property PressurePlate5 Auto
ObjectReference property PressurePlate6 Auto

dunMarkarthWizardPlateSystemPlate Plate1 
dunMarkarthWizardPlateSystemPlate Plate2 
dunMarkarthWizardPlateSystemPlate Plate3 
dunMarkarthWizardPlateSystemPlate Plate4 
dunMarkarthWizardPlateSystemPlate Plate5 
dunMarkarthWizardPlateSystemPlate Plate6 

bool busy = False

Event OnLoad()
	;Wait for everything to load.
	Utility.Wait(1)
	
	;Perform all the casts now for easier readability.
	Plate1 = PressurePlate1 as dunMarkarthWizardPlateSystemPlate
	Plate2 = PressurePlate2 as dunMarkarthWizardPlateSystemPlate
	Plate3 = PressurePlate3 as dunMarkarthWizardPlateSystemPlate
	Plate4 = PressurePlate4 as dunMarkarthWizardPlateSystemPlate
	Plate5 = PressurePlate5 as dunMarkarthWizardPlateSystemPlate
	Plate6 = PressurePlate6 as dunMarkarthWizardPlateSystemPlate
	
	StateChange()
EndEvent

;Queries all pressure plates to determine if any have anything in their triggers.
bool Function GetAnyInTrigger()
	return (Plate1.GetInTrigger() || Plate2.GetInTrigger() || Plate3.GetInTrigger() || Plate4.GetInTrigger() || Plate5.GetInTrigger() || Plate6.GetInTrigger())
EndFunction

;Checks to see what state we should be in.
Function StateChange()
; 	;Debug.Trace("State Change Triggered")
	if (GetAnyInTrigger() && Self.GetState() == "Up")
		GoToState("Down")
	ElseIf (!(GetAnyInTrigger()) && Self.GetState() == "Down")
		GoToState("Up")
	EndIf
EndFunction

Function PlayDownAll()
	Plate1.PlayDown()
	Plate2.PlayDown()
	Plate3.PlayDown()
	Plate4.PlayDown()
	Plate5.PlayDown()
	Plate6.PlayDown()
EndFunction

Function PlayUpAll()
	Plate1.PlayUp()
	Plate2.PlayUp()
	Plate3.PlayUp()
	Plate4.PlayUp()
	Plate5.PlayUp()
	Plate6.PlayUp()
EndFunction


auto State Up
	Event onBeginState()
		busy = True
		PlayUpAll()
		Utility.Wait(1.25)
		activate(self)
; 		;Debug.Trace("Plate System Up")
		StateChange()
		busy = False
	EndEvent
EndState

State Down
	Event onBeginState()
		busy = True
		PlayDownAll()
		Utility.Wait(1.25)
; 		;Debug.Trace("Plate System Down")
		activate(self)
		StateChange()
		busy = False
	EndEvent
EndState
