scriptName defaultActivateOnLoad extends ObjectReference
{ Activates the object's linkedref on load. Includes a slight delay to make sure the target is loaded, too. }

ObjectReference myLinkedRef
Keyword Property linkedRefKeyword Auto
bool property doOnce Auto

Auto State PreActivation
	Event OnLoad()
		Utility.Wait(0.25)
		Self.GetLinkedRef(LinkedRefKeyword).Activate(Self)
		if (doOnce)
			gotoState("PostActivation")
		EndIf
	EndEvent

	Event OnActivate(ObjectReference obj)
		OnLoad()
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
