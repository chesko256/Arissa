Scriptname dunBloatedManToggleBloodmoon extends ObjectReference
{Scripts to toggle the Bloodmoon weather override in Bloated Man's Grotto.}

Weather property Bloodmoon Auto
{Which weather override should be used?}

GlobalVariable property GameHour Auto
{The gamehour.}

Event OnLoad()
	Bloodmoon.ForceActive(True)
	if (GameHour.GetValue() < 19 && GameHour.GetValue() > 2)
		GameHour.SetValue(23)
	EndIf
EndEvent

Event OnUnload()
	Weather.ReleaseOverride()
EndEvent