scriptName defaultDisableOnResetOtherCondition extends objectReference
{This script disables its object on reset if the location has been cleared once
	it requires a linkRef to an xmarker to track this state}


;;;;;;;;;;;;;This uses a linkedRef instead of a property because properties are reset when the cell is;;;;;;;;;;
event onReset()
; 	;debug.Trace(self + ": has called onReset - hasBeenCleared = " + hasBeenCleared)
	if getLinkedRef().isEnabled()
; 		;debug.Trace(self + ": has found that my linkedRef is enabled, enabling self")
		Self.Enable()
	Else
; 		;debug.Trace(self + ": has found that my linkedRef is disabled, disabling self")
		Self.Disable()
		if disableOtherRefsAsWell
			if otherRefToChange01
				otherRefToChange01.disable()
			endif
			if otherRefToChange02
				otherRefToChange02.disable()
			endif
			if otherRefToChange03
				otherRefToChange03.disable()
			endif
			if otherRefToChange04
				otherRefToChange04.disable()
			endif
			if otherRefToChange05
				otherRefToChange05.disable()
			endif
		elseif enableOtherRefsAsWell
			if otherRefToChange01
				otherRefToChange01.enable()
			endif
			if otherRefToChange02
				otherRefToChange02.enable()
			endif
			if otherRefToChange03
				otherRefToChange03.enable()
			endif
			if otherRefToChange04
				otherRefToChange04.enable()
			endif
			if otherRefToChange05
				otherRefToChange05.enable()
			endif
		endif
		
	EndIf
endEvent

bool property disableOtherRefsAsWell auto
{If this is true, the refs to change will be disabled when this object is
	If this is true, enableOtherRefsAsWell is ignored
	default = false}

bool property enableOtherRefsAsWell auto
{If this is true, the refs to change will be enabled when this object is
	If disableOtherRefsAsWell is true, this is ignored
	default = false}

ObjectReference property otherRefToChange01 auto
ObjectReference property otherRefToChange02 auto
ObjectReference property otherRefToChange03 auto
ObjectReference property otherRefToChange04 auto
ObjectReference property otherRefToChange05 auto
