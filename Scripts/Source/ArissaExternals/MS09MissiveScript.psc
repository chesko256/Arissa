Scriptname MS09MissiveScript extends ReferenceAlias  

Quest Property MS09  Auto  



Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if MS09.GetStage() == 20
			MS09.SetStage(30)
		endif
	endif

EndEvent