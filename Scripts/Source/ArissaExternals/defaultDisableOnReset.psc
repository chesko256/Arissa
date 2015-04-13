ScriptName defaultDisableOnReset extends objectReference
{Disables this object when the cell resets.}

Event OnReset()
	Self.Disable()
EndEvent