Scriptname DA08EbonyBladeScript extends ObjectReference  

Quest Property DA08 auto
Scene Property InitialPickup auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
;     Debug.Trace("DA08: Ebony Blade changing hands.")
	if (akNewContainer == Game.GetPlayer())
;         Debug.Trace("DA08: Player got Ebony Blade.")
		if (DA08.GetStage() == 50)
;             Debug.Trace("DA08: Mephala should be talking now.")
			InitialPickup.Start()
		endif
	endif
EndEvent


