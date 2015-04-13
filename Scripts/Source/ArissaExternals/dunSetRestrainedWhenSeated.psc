Scriptname dunSetRestrainedWhenSeated extends ReferenceAlias  
{Sets Restrained when the actor sits. Clears restrained when called, and/or when the actor gets up.}

Function SetRestrained(bool shouldBeRestrained)
	Self.GetActorRef().SetRestrained(shouldBeRestrained)
EndFunction

Event OnSit(ObjectReference furniture)
	Self.GetActorRef().SetRestrained(True)
EndEvent

Event OnGetUp(ObjectReference furniture)
	Self.GetActorRef().SetRestrained(False)
EndEvent