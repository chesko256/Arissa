scriptName defaultDisableOnResetIfLocWasCleared extends objectReference
{This script disables its object on reset if the location has been cleared once
	it requires a linkRef to an xmarker to track this state}


event onCellDetach()
; 	;debug.Trace(self + ": has run onCellDetach")
	if self.getCurrentLocation().isCleared()
; 		;debug.Trace(self + ": cell is cleared - setting hasBeenCleared")
		getLinkedRef().disable()
	endIf
endEvent

;;;;;;;;;;;;;This uses a linkedRef instead of a property because properties are reset when the cell is;;;;;;;;;;
event onReset()
; 	;debug.Trace(self + ": has called onReset - hasBeenCleared = " + hasBeenCleared)
	if getLinkedRef().isEnabled()
; 		;debug.Trace(self + ": has found that my linkedRef is enabled, enabling self")
		Self.Enable()
	Else
; 		;debug.Trace(self + ": has found that my linkedRef is disabled, disabling self")
		Self.Disable()
	EndIf
endEvent


