scriptName defaultOnActivateEvaluatePackage extends Actor
{
- Evaluate the actor's package when they're activated.
}

bool property doOnce = False auto

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		Self.EvaluatePackage()
		if (doOnce)
			gotoState("PostActivation")
		EndIf
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
