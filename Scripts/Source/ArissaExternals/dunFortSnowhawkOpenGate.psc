scriptName dunFortSnowhawkOpenGate extends ObjectReference

Event OnTrigger(ObjectReference obj)
	NorPortcullisScript gate = Self.GetLinkedRef() as NorPortcullisScript
	if (obj != Game.GetPlayer() && gate.GetState() == "upPosition")
		gate.Activate(obj)
	EndIf
EndEvent

		
