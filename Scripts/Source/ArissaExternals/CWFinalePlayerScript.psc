Scriptname CWFinalePlayerScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if GetOwningQuest().GetStageDone(400)
; 		CWScript.Log("CWFinalePlayerScript", "OnLocationChange() Stage 400 done, stopping quest")
		GetOwningQuest().stop()
	Else
; 		CWScript.Log("CWFinalePlayerScript", "OnLocationChange() Stage 400 NOT done, NOT stopping quest")
	EndIf

EndEvent
