ScriptName MarriageFINPlayerScript extends ReferenceAlias

ReferenceAlias Property HouseCenter Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If (HouseCenter.GetRef().GetCurrentLocation() == akNewLoc)
	
		If (GetOwningQuest().IsObjectiveDisplayed(10) == 1)
; 			Debug.Trace(self + ("Player has entered spouse's house. Clear objective."))
			GetOwningQuest().SetStage(25)
		EndIf
	
	EndIf


EndEvent