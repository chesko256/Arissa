Scriptname MQ105PlayerScript extends ReferenceAlias  
{used to detect player change of location}

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + " oldloc=" + akOldLoc + ", newLoc=" + akNewLoc)
	; watch for player to enter High Hrothgar location
	if GetOwningQuest().getStageDone(5) == 1 && GetOwningQuest().getStageDone(15) == 0
		if akNewLoc == (GetOwningQuest() as MQ105QuestScript).HighHrothgarLocation
			GetOwningQuest().SetStage(15)
		endif
	endif

endEvent

; detect when player equips Unrelenting Force shout
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if GetOwningQuest().GetStageDone(82)==1 && GetOwningQuest().GetStageDone(90)==0 && GetOwningQuest().GetStageDone(85)==0
; 		debug.trace(self + " player equipped " + akBaseObject)
		Shout equipShout = akBaseObject as Shout
		if equipShout == UnrelentingForceShout
			GetOwningQuest().SetStage(85)
		endif
	endif
endEvent

Shout Property UnrelentingForceShout Auto

