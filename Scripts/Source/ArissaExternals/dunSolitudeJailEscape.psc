scriptName dunSolitudeJailEscape extends ObjectReference
{After the player opens the secret exit in Solitude Jail, leaving the cell by any means disables the secret exit in the future.}

ObjectReference property LightEnableMarker Auto
ObjectReference property SecretExitEnableMarker Auto
ObjectReference property TorchSconce Auto
bool initialLoad = False

Event OnCellAttach()
	if (!Self.IsDisabled())
		LightEnableMarker.Disable()
		(TorchSconce as RemovableTorchSconce01SCRIPT ).StartsEmpty = True
		(TorchSconce as RemovableTorchSconce01SCRIPT ).RemoveTorch()
		SecretExitEnableMarker.Disable()
	EndIf
EndEvent
	