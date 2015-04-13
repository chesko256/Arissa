scriptName SummonTargetFXActivatorScript extends ObjectReference

Event OnLoad()
	Utility.Wait(5)
	Self.Disable()
	Utility.Wait(1)
	Self.Delete()
EndEvent
