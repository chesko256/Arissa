Scriptname DA08WhisperingDoorKeyScript extends ObjectReference  

Quest Property DA08 Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if ((DA08.GetStage() > 20) && (DA08.GetStage() < 40))
			DA08.SetStage(40)
		endif
	endif
EndEvent
