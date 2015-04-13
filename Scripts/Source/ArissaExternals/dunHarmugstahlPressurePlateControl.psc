Scriptname dunHarmugstahlPressurePlateControl extends ObjectReference  
import Debug

objectReference property pPlateA Auto
objectReference property pPlateB Auto
objectReference property pPlateC Auto
objectReference property pPlateD Auto

objectReference property topDart Auto

objectReference property puzDoor Auto
objectReference property puzDoorControl Auto

int puzStage = 1

event OnActivate (ObjectReference TriggerRef)
	if (puzStage == 1)
		if (TriggerRef == pPlateA)
			puzStage = 2
			Notification("PlateA Triggered")
		else
			wrongAnswer()
		endif
	elseif (puzStage==2)
		if ( TriggerRef == pPlateC)
			puzStage = 3
			Notification("PlateC Triggered")
		else
			wrongAnswer()
		endif
	elseif (puzStage==3)
		if ( TriggerRef == pPlateD)
			puzStage = 4
			Notification("PlateD Triggered")
		else
			wrongAnswer()
		endif
	elseif(puzStage==4)
		if(TriggerRef == pPlateB)
			puzStage = 5
			Notification("PlateB Triggered")
			openDoor()
		else
			wrongAnswer()
		endif
	endif
endevent

function wrongAnswer()
	Notification("Wrong Sequence")
	topDart.activate(topDart)
	resetPuzzle()
endfunction

function resetPuzzle()
	puzStage = 1 
endfunction

function openDoor()
	Notification("Open Door")
	puzDoor.activate(puzDoorControl)
endfunction
