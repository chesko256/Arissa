Scriptname C05WatchedPlayerScript extends ReferenceAlias  

Location Property WhiterunLocation auto
Quest Property GawkersQuest auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	Debug.Trace("C05: Player changing location.")
	if (!GetReference().IsInInterior())
; 		Debug.Trace("C05: ... in exterior...")
		if (akNewLoc != WhiterunLocation)
; 			Debug.Trace("C05: ... that isn't Whiterun...")
			if (GawkersQuest.IsRunning())
				GawkersQuest.Stop()
			endif
		endif
	endif
EndEvent

