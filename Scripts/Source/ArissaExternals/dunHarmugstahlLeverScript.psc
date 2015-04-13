scriptName dunHarmugstahlLeverScript extends objectReference
import Debug
import Utility

ObjectReference Property doorStart Auto
ObjectReference Property door01 Auto
ObjectReference Property door02 Auto
ObjectReference Property door03 Auto 
ObjectReference Property door04 Auto
ObjectReference Property door05 Auto
;ObjectReference Property doorController Auto

ObjectReference Property lever01 Auto
ObjectReference Property lever02 Auto
ObjectReference Property lever03 Auto
ObjectReference Property lever04 Auto

ObjectReference Property startTrigger Auto

default2StateActivator door01Script
default2StateActivator door02Script
default2StateActivator door03Script
default2StateActivator door04Script

ObjectReference Property Collision  Auto  

bool isComplete = false

event OnCellLoad()
	door01Script = door01 as default2StateActivator
	door02Script = door02 as default2StateActivator
	door03Script = door03 as default2StateActivator
	door04Script = door04 as default2StateActivator
	door01script.SetOpen(False)
	door02script.SetOpen(False)
	door03script.SetOpen(False)
	door04script.SetOpen(False)
endEvent

event OnActivate (objectReference TriggerRef)
	;checkAllOpen()
	if (isComplete == false)
		if (TriggerRef == lever01)
			openDoorPatternA()
			checkAllOpen()
		elseif (TriggerRef == lever02)
			openDoorPatternB()
			checkAllOpen()
		elseif (TriggerRef == lever03)
			openDoorPatternC()
			checkAllOpen()
		elseif (TriggerRef == lever04)
			openDoorPatternD()
			checkAllOpen()
		elseif (TriggerRef == startTrigger)
			;Notification("Start Trigger")
			puzStart()
		endif
	endif
endevent

function puzStart()
	startTrigger.Disable()
	openDoorStart()
endFunction

function openDoorPatternA()
	lever01.BlockActivation()
	lever02.BlockActivation()
	lever03.BlockActivation()
	lever04.BlockActivation()
	openDoor01()
	openDoor02()
	lever01.BlockActivation(false)
	lever02.BlockActivation(false)
	lever03.BlockActivation(false)
	lever04.BlockActivation(false)
endfunction

function openDoorPatternB()
	lever01.BlockActivation()
	lever02.BlockActivation()
	lever03.BlockActivation()
	lever04.BlockActivation()
	openDoor01() 
	openDoor02()
	openDoor03()
	lever01.BlockActivation(false)
	lever02.BlockActivation(false)
	lever03.BlockActivation(false)
	lever04.BlockActivation(false)
endfunction

function openDoorPatternC()
	lever01.BlockActivation()
	lever02.BlockActivation()
	lever03.BlockActivation()
	lever04.BlockActivation()
	openDoor02()
	openDoor03()
	openDoor04()
	lever01.BlockActivation(false)
	lever02.BlockActivation(false)
	lever03.BlockActivation(false)
	lever04.BlockActivation(false)
endfunction

function openDoorPatternD()
	lever01.BlockActivation()
	lever02.BlockActivation()
	lever03.BlockActivation()
	lever04.BlockActivation()
	openDoor03()
	openDoor04()
	lever01.BlockActivation(false)
	lever02.BlockActivation(false)
	lever03.BlockActivation(false)
	lever04.BlockActivation(false)
endfunction


function openDoor01()
	wait(0.1)
	door01script.SetOpen(!door01script.isOpen)
endFunction

function openDoor02() 
	;lever01.goToState( "Inactive" )
	;lever02.goToState( "Inactive" )
	;lever03.goToState( "Inactive" )
	;lever04.goToState( "Inactive" )
	door02script.SetOpen(!door02script.isOpen)
endFunction

function openDoor03()
	;lever01.goToState( "Inactive" )
	;lever02.goToState( "Inactive" )
	;lever03.goToState( "Inactive" )
	;lever04.goToState( "Inactive" )
	door03script.SetOpen(!door03script.isOpen)
endFunction

function openDoor04()
	;lever01.goToState( "Inactive" )
	;lever02.goToState( "Inactive" )
	;lever03.goToState( "Inactive" )
	;lever04.goToState( "Inactive" )
	door04script.SetOpen(!door04script.isOpen)
endFunction

function openDoorStart()
	;lever01.goToState( "Inactive" )
	;lever02.goToState( "Inactive" )
	;lever03.goToState( "Inactive" )
	;lever04.goToState( "Inactive" )
	door05.Activate(self)
	;openDoor01()
	;openDoor02()
	;openDoor03()
	;openDoor04()
endFunction

function checkAllOpen()
	if (door01script.isOpen && door02script.isOpen && door03script.isOpen && door04script.isOpen)
		;Notification("COMPLETED")
		isComplete = true
		lever01.goToState( "Inactive" )
		lever02.goToState( "Inactive" )
		lever03.goToState( "Inactive" )
		lever04.goToState( "Inactive" )
		lever01.BlockActivation()
		lever02.BlockActivation()
		lever03.BlockActivation()
		lever04.BlockActivation()
		Collision.Disable()
		door05.Activate(self)
		door01script.SetOpen(TRUE)
		door02script.SetOpen(TRUE)
		door03script.SetOpen(TRUE)
		door04script.SetOpen(TRUE)
	else
		;Notification("NOT COMPLETED")
	endif
endfunction


