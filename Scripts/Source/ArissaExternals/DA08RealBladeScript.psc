Scriptname DA08RealBladeScript extends ObjectReference  

Quest Property DA08 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
; 	Debug.Trace("DA08: Ebony Blade changing hands.")
	if (akNewContainer == Game.GetPlayer())
		if (DA08.GetStage() == 110)
			DA08.SetStage(200)
		endif
	endif
EndEvent
