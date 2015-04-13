Scriptname CWGarrisonObserverPlayerScript extends ReferenceAlias  
{Script on Player alias (holding playerref) in CWGarrisonObserver quest}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

; 	CWScript.Log("CWGarrisonObserverPlayerScript", self + " OnLocationChange() Old location:" + akOldLoc + ", New location:" + akNewLoc)

	CWGarrisonObserverScript CWGarrisonObserverS = GetOwningQuest() as CWGarrisonObserverScript

; ;	CWScript.Log("CWGarrisonObserverPlayerScript", self + " DEBUG: CWGarrisonObserverS == " + CWGarrisonObserverS, 1, true, True)
; ;	CWScript.Log("CWGarrisonObserverPlayerScript", self + " DEBUG: CWGarrisonObserverS.Garrison == " + CWGarrisonObserverS.Garrison, 1, true, True)
; ;	CWScript.Log("CWGarrisonObserverPlayerScript", self + " DEBUG: CWGarrisonObserverS.Garrison.GetLocation() == " + CWGarrisonObserverS.Garrison.GetLocation(), 1, true, True)
; ;	CWScript.Log("CWGarrisonObserverPlayerScript", self + " DEBUG: CWGarrisonObserverS.Garrison.GetLocation().isChild(akNewLoc) == " + CWGarrisonObserverS.Garrison.GetLocation().isChild(akNewLoc) , 1, true, True)
	
	
	
	;akNewLoc can be None if it's an exterior cell not in a location, so check for that before asking if the garrison location is a child of a None location
	if akNewLoc == None || CWGarrisonObserverS.Garrison.GetLocation().isChild(akNewLoc) == false ;if akNewLoc is NOT a child of the Garrison Location
	
		CWGarrisonObserverS.playerLeftLocation()
	
	EndIf
	
EndEvent
