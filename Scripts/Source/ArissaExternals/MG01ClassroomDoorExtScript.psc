Scriptname MG01ClassroomDoorExtScript extends ReferenceAlias

Quest Property MG01 Auto

Event OnActivate(ObjectReference AkActionRef)


;disable player's ability to use weapon if he enters the cell during a specific portion of the quest



	if MG01.GetStage() >= 30
		if MG01.GetStage() < 200
			if AkActionRef == Game.GetPlayer()
				Game.DisablePlayerControls(false, true, false, false, false, false)
				
			endif
		endif
	endif

EndEvent
 
