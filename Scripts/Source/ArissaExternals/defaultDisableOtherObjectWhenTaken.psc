scriptName defaultDisableOtherObjectWhenTaken extends ObjectReference
{when this is aquired by the player, disable the objectReference set in the property
	This is meant for use with cell reset enabling/disabling}

objectReference property refToDisable auto	
	
auto state waiting
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == game.GetPlayer()
			goToState("Done")
			refToDisable.disable()
		endif
	endEvent
endState

state Done
endState


