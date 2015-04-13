scriptname dunFellglow_PrisonerSceneTrigger extends objectReference
{When a member of the prisoner faction enters the trigger, start the scene.}

Faction property prisonerFaction Auto
Scene property prisonerScene Auto

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		if ((triggerRef As Actor).IsInFaction(prisonerFaction))
			prisonerScene.Start()
			GoToState("allDone")
		EndIf
	EndEvent
EndState

State allDone
	;do nothing
endState