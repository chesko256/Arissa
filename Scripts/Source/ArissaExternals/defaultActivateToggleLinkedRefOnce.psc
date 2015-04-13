scriptName defaultActivateToggleLinkedRefOnce extends ObjectReference
{
- Toggles the state of the linked ref when this object is activated.
}

ObjectReference myLinkedRef
Keyword property linkKeyword Auto
bool property requirePlayer = False Auto
bool property requireNOTPlayer = False Auto
bool property fade = False Auto
bool property reset = True Auto

Event OnReset()
	gotoState("PreActivation")
EndEvent

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		if ((!requirePlayer && !requireNOTPlayer) || (requirePlayer && triggerRef == Game.GetPlayer()) || (requireNOTPlayer && triggerRef != Game.GetPlayer()))
			myLinkedRef = GetLinkedRef(linkKeyword) as ObjectReference
			if (myLinkedRef.IsEnabled())
				myLinkedRef.Disable(fade)
			Else
				myLinkedRef.Enable(fade)
			EndIf
			if (reset)
; 				Debug.Trace("Now awaiting reset.")
				gotoState("PostActivation")
			Else
				gotoState("DoNothing")
			EndIf
		EndIf
	EndEvent
EndState

STATE PostActivation
EndState

STATE DoNothing
	;Do nothing
EndState
