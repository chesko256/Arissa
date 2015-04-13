Scriptname MG07StaffScript extends ReferenceAlias  

Quest Property MG07  Auto  


Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if MG07.GetStage() < 50
			MG07.SetStage(50)
		endif
	endif

EndEvent