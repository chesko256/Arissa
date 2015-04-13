Scriptname MQ201PlayerScript extends ReferenceAlias  

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + ": OnLocationChange - akoldloc=" + akoldloc + ", aknewloc=" + aknewloc)
	MQ201QuestScript myQuest = GetOwningQuest() as MQ201QuestScript 

	; set quest stage when player returns to Riverwood
	if myQuest.GetStageDone(30) == 1 && myQuest.GetStageDone(35) == 0
		if akNewLoc == myQuest.RiverwoodInnLocation
			myQuest.setstage(35)
		endif
	endif
	
	; update quest when player escapes embassy
	if myQuest.GetStage() >= 210 && myQuest.GetStageDone(230) == 0 && Game.GetPlayer().GetCurrentLocation() != myQuest.ThalmorEmbassyLocation
		myQuest.setStage(230)
	endif

endEvent
