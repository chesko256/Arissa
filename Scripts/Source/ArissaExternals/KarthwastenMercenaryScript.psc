ScriptName KarthwastenMercenaryScript extends Actor

Quest Property FreeformKarthwastenA Auto

Event OnUnload()

	If (FreeformKarthwastenA.GetStage() >= 100)
		Self.Disable()
		Self.Delete()
	EndIf

EndEvent