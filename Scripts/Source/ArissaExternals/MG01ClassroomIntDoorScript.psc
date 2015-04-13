Scriptname MG01ClassroomIntDoorScript extends ReferenceAlias

Quest Property MG01  Auto  

Event OnActivate(ObjectReference AkActionRef)


;enable player controls if he leaves this cell during the quest

	if MG01.GetStage() >= 30
		if MG01.GetStage() <= 200
			if AkActionRef == Game.GetPlayer()
				Game.EnablePlayerControls()
			endif
		endif
	endif

EndEvent
 