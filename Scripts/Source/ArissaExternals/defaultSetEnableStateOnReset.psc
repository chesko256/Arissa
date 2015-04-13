scriptName defaultSetEnableStateOnReset extends ObjectReference
{Enables or disables this object on reset.}

bool property EnableOnReset = True Auto
{Should this object be enabled or disabled on reset? Default: TRUE}

Event OnReset()
	if (EnableOnReset)
		Self.Enable()
	Else
		Self.Disable()
	EndIf
EndEvent