ScriptName dunFolgunthurBossTrigger extends objectReference
{Trigger that staggers the player when Mikrul emerges.}

ObjectReference property Mikrul Auto
ObjectReference property StaggerMarker Auto
Sound property RumbleSFX Auto

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Mikrul.Activate(Self)
		Game.GetPlayer().RampRumble(0.75, 2, 1600)
		RumbleSFX.Play(Mikrul)
		Utility.Wait(0.25)
		Game.GetPlayer().SetAnimationVariableBool("bStaggerPlayerOverride", True)
		StaggerMarker.KnockAreaEffect(0.5, 500)
		Utility.Wait(0.25)
		Game.GetPlayer().SetAnimationVariableBool("bStaggerPlayerOverride", False)
		gotoState("allDone")
	EndEvent
endState

State allDone
	;do nothing
endState
