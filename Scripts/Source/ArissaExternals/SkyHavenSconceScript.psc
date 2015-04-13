Scriptname SkyHavenSconceScript extends ObjectReference  

auto STATE WaitingToBeActivated
	EVENT OnActivate (objectReference triggerRef)
; 		Debug.Trace("ACTIVATED")
		TurnOnLight()
	EndEvent


	event OnLoad()
		if EnableOnLoadMarker.IsEnabled() == 1
			; make sure I'm on as well
			TurnOnLight()
		endif
	endEvent

EndState

STATE done
	;done doing stuff
endSTATE

function TurnOnLight()
	; get linked refs
	ObjectReference mySconce = GetLinkedRef(SconceKeyword)
	ObjectReference myLight = GetLinkedRef(LightKeyword)
	if mySconce
		GoToState("done")
		mySconce.setAnimationVariableFloat("fToggleBlend", 1)
		utility.wait(1)
		myLight.Enable()
	endif
endFunction

Keyword Property SconceKeyword  Auto  
{the keyword for GetLinkedRef to the animating sconce object}


Keyword Property LightKeyword  Auto  
{the keyword for GetLinkedRef to the light object}



ObjectReference Property EnableOnLoadMarker  Auto  
{when this marker is enabled, turn my light on OnLoad
(in case Delphine skipped any)}
