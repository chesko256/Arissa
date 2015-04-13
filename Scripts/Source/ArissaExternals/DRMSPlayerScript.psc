Scriptname DRMSPlayerScript extends ReferenceAlias  Conditional

Quest Property pDRMSQuest Auto
DRMSQuestScript Property pDRMSQS  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	if pDRMSQS.pScriptGo == 1
		pDRMSQuest.SetStage(200)
	endif

endEvent