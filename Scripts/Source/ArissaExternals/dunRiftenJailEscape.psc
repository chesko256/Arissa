scriptName dunRiftenJailEscape extends ObjectReference
{After the player opens the secret exit in Riften Jail, leaving the cell by any means disables the secret exit in the future.}

ObjectReference property SecretExitEnableMarker Auto
ObjectReference property SecretExitLightsEnableMarker Auto

Event OnCellAttach()
	if (!Self.IsDisabled())
		SecretExitEnableMarker.Disable()
		SecretExitLightsEnableMarker.Disable()
	EndIf
EndEvent