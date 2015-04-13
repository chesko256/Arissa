Scriptname MS11ClueScript extends ObjectReference  


Quest Property MS11 auto
bool found = false

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer() && !found)
; 		Debug.Trace("MS11: Found clue! " + self)
		if (MS11.GetStage() <= 70)
			MS11.SetStage(70)
			found = true
		endif
	endif
EndEvent
