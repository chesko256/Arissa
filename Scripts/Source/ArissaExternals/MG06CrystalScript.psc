Scriptname MG06CrystalScript extends ReferenceAlias  

Quest Property MG06  Auto  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if MG06.GetStage() == 32
			MG06.SetStage(35)
		endif
	endif

EndEvent