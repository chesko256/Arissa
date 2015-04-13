Scriptname MG06JournalScript extends ReferenceAlias  

quest Property MG06  Auto  


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if MG06.GetStage() < 30
			MG06.SetStage(30)
		endif
	endif

EndEvent