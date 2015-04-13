Scriptname defaultEnableLinkedRefOnActivate extends ObjectReference  
{enable OR disable linked ref on activate}

auto STATE WaitingToBeActivated
	EVENT OnActivate (objectReference triggerRef)
; 		;Debug.Trace("ACTIVATED")
		; get linked ref
		ObjectReference myRef = GetLinkedRef(LinkedRefKeyword)
		if myRef
			GoToState("done")
			if bEnableOnActivate
				myRef.Enable()
			else
				myRef.Disable()
			endif
		endif
	EndEvent
EndState

STATE done
	;done doing stuff
endSTATE


bool Property bEnableOnActivate = true  Auto  
{true (default) = enable linked ref
false = disable linked ref
}

Keyword Property LinkedRefKeyword  Auto  
{optional - if supplied, use this for GetLinkedRef}
