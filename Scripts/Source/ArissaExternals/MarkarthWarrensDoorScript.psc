ScriptName MarkarthWarrensDoorScript extends ObjectReference

Event OnOpen(ObjectReference akActionRef)

	if (akActionRef != Game.GetPlayer())
		Utility.Wait(15)
		Self.SetOpen(False)
	EndIf
	
EndEvent