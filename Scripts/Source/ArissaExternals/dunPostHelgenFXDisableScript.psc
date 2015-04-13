scriptName dunPostHelgenFXDisableScript extends ObjectReference

float property myDaysPassed auto
GlobalVariable property gGameDaysPassed auto
ObjectReference property myFX auto

;****************************

Event onCellAttach()
	if (myDaysPassed <= gGameDaysPassed.getValue())
		myFX.disable()
		disable()
	endif
endEvent

;****************************

Event onCellDetach()
	if (myDaysPassed <= gGameDaysPassed.getValue())
		myFX.disable()
		disable()
	endif
endEvent

;****************************