Scriptname DA16ErandurCheckpointTrigger extends ObjectReference  Conditional

ReferenceAlias Property pErandurAlias Auto
GlobalVariable Property pDA16ErandurCheckpoint Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDA16ErandurCheckpoint.Value == 0
		if akActionRef == pErandurAlias.GetActorRef()
			pDA16ErandurCheckpoint.Value = 1
		endif
	endif

endEvent
		