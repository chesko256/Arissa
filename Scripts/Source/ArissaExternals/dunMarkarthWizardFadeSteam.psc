scriptName dunMarkarthWizardFadeSteam extends ObjectReference

ObjectReference property Steam1 Auto
ObjectReference property Steam2 Auto
ObjectReference property Steam3 Auto
ObjectReference property Steam4 Auto
ObjectReference property Steam5 Auto
ObjectReference property Steam6 Auto

bool property isEnabled = True auto
bool property fade = True auto

Event OnActivate(ObjectReference obj)
	if (isEnabled)
		Steam1.Disable(fade )
		Steam2.Disable(fade )
		Steam3.Disable(fade )
		Steam4.Disable(fade )
		Steam5.Disable(fade )
		Steam6.Disable(fade )
	Else
		Steam1.Enable(fade )
		Steam2.Enable(fade )
		Steam3.Enable(fade )
		Steam4.Enable(fade )
		Steam5.Enable(fade )
		Steam6.Enable(fade )
	EndIf
	isEnabled = !isEnabled
EndEvent
