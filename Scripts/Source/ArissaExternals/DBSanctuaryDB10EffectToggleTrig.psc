scriptName DBSanctuaryDB10EffectToggleTrig extends objectReference
{Script to toggle the DB10 Camera Attach FX.}

ObjectReference property LoadTrigger Auto
bool property isEnableTrigger Auto

Event OnTriggerEnter(ObjectReference triggerRef)
	if (triggerRef == Game.GetPlayer())
		if (isEnableTrigger)
			(LoadTrigger as DBSanctuaryDB10LoadCheck).EnableSmokeAttachFX()
		Else
			(LoadTrigger as DBSanctuaryDB10LoadCheck).DisableSmokeAttachFX()
		EndIf
	EndIf
EndEvent