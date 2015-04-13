Scriptname C03AelaUnderforgeTransformScript extends ReferenceAlias  

Location Property WhiterunUnderforgeLocation auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if (  (GetOwningQuest().GetStage() >= 15) && (GetOwningQuest().GetStage() < 30)  )
		if (akNewLoc == WhiterunUnderforgeLocation)
			; turn to werewolf
		elseif (akOldLoc == WhiterunUnderforgeLocation)
			; turn back
		endif
	endif
EndEvent
