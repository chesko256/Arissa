Scriptname DA16ErandurOverrideTriggerScript extends ObjectReference  Conditional

ReferenceAlias Property pErandurAlias Auto
ObjectReference Property pDA16ErandurOverrideMarker Auto
int Property pOverrideUsed Auto
GlobalVariable Property pDA16ErandurCheckpoint Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pOverrideUsed == 0
		if akActionRef == Game.GetPlayer()
			if pDA16ErandurCheckpoint.Value == 0
				pErandurAlias.GetActorRef().Moveto(pDA16ErandurOverrideMarker)
				pErandurAlias.GetActorRef().EvaluatePackage()
				pOverrideUsed = 1
			elseif pDA16ErandurCheckpoint.Value >= 1
				pOverrideUsed = 2
			endif
		endif
	endif	

endEvent
