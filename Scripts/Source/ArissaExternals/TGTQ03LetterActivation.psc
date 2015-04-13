Scriptname TGTQ03LetterActivation extends ObjectReference  


Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		Self.GetLinkedRef().SendStealAlarm(Game.GetPlayer())
	endif

endEvent