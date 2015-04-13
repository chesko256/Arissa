ScriptName dunGeirmundsBossTrigger extends objectReference
{Trigger that starts the boss battle in Geirmunds Hall.}

ObjectReference property Sigdis Auto
Sound property RumbleSFX Auto

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		if (triggerRef == Game.GetPlayer())
			Sigdis.Activate(Self)
			Game.GetPlayer().RampRumble(1, 2, 1600)
			RumbleSFX.Play(Sigdis)
			Utility.Wait(0.25)
			Game.GetPlayer().SetAnimationVariableBool("bStaggerPlayerOverride", True)
			Sigdis.KnockAreaEffect(0.5, 1200)
			Utility.Wait(0.25)
			Game.GetPlayer().SetAnimationVariableBool("bStaggerPlayerOverride", False)
			gotoState("allDone")
		EndIf
	EndEvent
endState

State allDone
	;do nothing
endState
