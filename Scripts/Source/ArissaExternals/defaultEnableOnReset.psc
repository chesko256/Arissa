ScriptName defaultEnableOnReset extends objectReference
{Enables this object when the cell resets.}

Event OnReset()
; 	Debug.Trace("Enable On Reset")
	Self.Enable()
EndEvent