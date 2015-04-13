Scriptname DA06ShagrolHammerScript extends ReferenceAlias  

Quest Property DA06  Auto  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if DA06.GetStage() == 90
		endif
	endif

EndEvent