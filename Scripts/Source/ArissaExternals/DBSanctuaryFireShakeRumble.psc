ScriptName DBSanctuaryFireShakeRumble extends objectReference
{OLD - Handles camera shake and rumble during the DB10 Fire sequence.}

Bool property active auto
Quest property DB10 auto

Event OnActivate(ObjectReference ref)
	active = !active
	if (active)
		LoopManager()
	EndIf
EndEvent

Function LoopManager()
	While (active)
		if (DB10.GetStage() >= 55)
			active = false
		else
			Game.GetPlayer().RampRumble(0.25, 1, 1600)
			Game.ShakeCamera()
			Utility.Wait(Utility.RandomInt(4, 8))
		EndIf
	EndWhile
EndFunction