ScriptName DA10AbandonedHouseTriggerScript extends ObjectReference

Int Property RunOnce Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == (Game.GetPlayer()) && RunOnce == 0
		Self.Lock(True)
		RunOnce = 1
	EndIf
EndEvent