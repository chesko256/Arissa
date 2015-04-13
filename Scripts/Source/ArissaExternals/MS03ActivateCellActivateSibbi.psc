Scriptname MS03ActivateCellActivateSibbi extends ObjectReference  
{
- Activate the specified linked ref when this object is activated.
}

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

ObjectReference myLinkedRef
Keyword Property linkedRefKeyword Auto

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		If myQuest.getstage()==stage
			myLinkedRef = GetLinkedRef(linkedRefKeyword) as ObjectReference
			myLinkedRef.Activate(triggerref)
		elseif myQuest.getstage()>stage
			gotoState("PostActivation")
		Endif
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState