Scriptname blackreachElevatorButtonScript extends ObjectReference  
;This script will be placed on the button that turns on the exit elevators in Blackreach.

import debug

globalVariable Property ElevatorPoweredVariable auto
;Each Blackreach exit elevator has its own variable that determines whether the elevator is powered.

objectReference Property MapMarker Auto

;ObjectReference Property blackreachExitElevator Auto
;ObjectReference Property blackreachEntranceElevator Auto

ObjectReference Property Gears01 Auto
ObjectReference Property Gears02 Auto
ObjectReference Property Gears03 Auto
ObjectReference Property Gears04 Auto
ObjectReference Property Gears05 Auto
ObjectReference Property Gears06 Auto

ObjectReference Property GateMarker Auto
ObjectReference Property LampFlame Auto
ObjectReference Property LampLight Auto


auto State Waiting
Event onActivate(objectReference akActivator)
;On activate, set powered variable to 1 and switches on gears
	ElevatorPoweredVariable.setValue(1)
	mapmarker.enable()
	Trace("The value of ElevatorPoweredVariable is" + (ElevatorPoweredVariable.getValueInt()))
	;blackreachExitElevator.blockActivation(false)
	;blackreachEntranceElevator.blockActivation(false)
	if gears01
		gears01.Activate(self)
	endif
	if gears02
		gears02.Activate(self)
	endif
	if gears03
		gears03.Activate(self)
	endif
	if gears04
		gears04.Activate(self)
	endif
	if gears05
		gears05.Activate(self)
	endif
	if gears06
		gears06.Activate(self)
	endif
	utility.wait(1)
	lampFlame.enable(true)
	lampLight.enable(true)
	utility.wait(1)
	gateMarker.activate(self)
	gatemarker.blockActivation(true)
	gotoState("done")
endEvent
endState

state done
	EVENT onActivate (objectReference akActivator)
		;Do nothing
	endEVENT
endState