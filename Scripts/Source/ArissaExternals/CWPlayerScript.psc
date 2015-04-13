Scriptname CWPlayerScript extends ReferenceAlias  
{Script attached to Player Alias in certain CW missions}

LocationAlias Property ShutDownQuestWhenPlayerLeavesThisLocationAlias Auto
{If this is set, call stop if the player leaves this location after the StageAfterWhichShutDownQuestWhenPlayerLeaves}

Int Property StageAfterWhichShutDownQuestWhenPlayerLeaves Auto
{After this or later quest stage, shut down quest after player leaves ShutDownQuestWhenPlayerLeavesThisLocationAlias}

LocationAlias Property SetStageWhenPlayerLeavesThisLocationAlias Auto
{If this is set, set stage to StageToSetWhenPlayerLeaves if the player leaves this location}

LocationAlias Property SetStageWhenPlayerArrivesAtThisLocationAlias Auto
{If this is set, set stage to StageToSetWhenPlayerArrives if the player arrives at this location}

LocationAlias Property SetStageWhenPlayerArrivesAtThisOtherLocationAliasAlso Auto
{If this is set, set stage to StageToSetWhenPlayerArrives if the player arrives at this location}

Int Property StageToSetWhenPlayerArrives Auto
{set this quest stage, when the player arrives at SetStageWhenPlayerArrivesAtThisLocationAlias}

Int Property StageToSetWhenPlayerLeaves Auto
{set this quest stage, when the player arrives at SetStageWhenPlayerLeavesThisLocationAlias}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Quest OwningQuest = GetOwningQuest()
	Location LocToCheck
	Location LocToCheck2
	
	if OwningQuest.IsRunning() == False		;just in case it's hung up in the shut down phase
		Return
	EndIf
	
	if ShutDownQuestWhenPlayerLeavesThisLocationAlias && StageAfterWhichShutDownQuestWhenPlayerLeaves
	
		LocToCheck = ShutDownQuestWhenPlayerLeavesThisLocationAlias.GetLocation()

		if OwningQuest.GetStage() >= StageAfterWhichShutDownQuestWhenPlayerLeaves && Game.GetPlayer().IsInLocation(LocToCheck) == False
; 			CWScript.Log("CWPlayerScript", self + "OnLocationChange() calling Stop() on owning quest because player left the location (" + LocToCheck + ") after stage " + StageAfterWhichShutDownQuestWhenPlayerLeaves)

			OwningQuest.stop()
		
		EndIf
		
	EndIf

	if StageToSetWhenPlayerLeaves && SetStageWhenPlayerLeavesThisLocationAlias
	
		LocToCheck = SetStageWhenPlayerLeavesThisLocationAlias.GetLocation()
	
		if OwningQuest.GetStageDone(StageToSetWhenPlayerLeaves) == False 
		
			if (LocToCheck && Game.GetPlayer().IsInLocation(LocToCheck) == false)
; 				CWScript.Log("CWPlayerScript", self + "OnLocationChange() calling setStage(" + StageToSetWhenPlayerLeaves +  ") on owning quest because player left location " + LocToCheck)

				OwningQuest.setStage(StageToSetWhenPlayerLeaves)
			
			endif
		
		EndIf
	
	EndIf
	
	if StageToSetWhenPlayerArrives && ( SetStageWhenPlayerArrivesAtThisLocationAlias || SetStageWhenPlayerArrivesAtThisOtherLocationAliasAlso)
	
		LocToCheck = SetStageWhenPlayerArrivesAtThisLocationAlias.GetLocation()
		LocToCheck2 = SetStageWhenPlayerArrivesAtThisOtherLocationAliasAlso.GetLocation()
	
		if OwningQuest.GetStageDone(StageToSetWhenPlayerArrives) == False 
		
			if (LocToCheck && Game.GetPlayer().IsInLocation(LocToCheck)) || (LocToCheck2 && Game.GetPlayer().IsInLocation(LocToCheck2))
; 				CWScript.Log("CWPlayerScript", self + "OnLocationChange() calling setStage(" + StageToSetWhenPlayerArrives +  ") on owning quest because player arrived at either location " + LocToCheck + " or the other optional location" + LocToCheck2)

				OwningQuest.setStage(StageToSetWhenPlayerArrives)
			
			endif
		
		EndIf
	
	
	EndIf
	

EndEvent



