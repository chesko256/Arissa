Scriptname DefaultAddItemAliasScript extends ReferenceAlias  
{Script to attach to quest alias that sets a stage in the owning quest when the item is added. NOTE: The stage will only be set once, even if the item is added to the container more than once.}

Int Property StageToSet Auto
{Mandatory: This is the stage that will be set when the item is added}

Int Property MinStageToCheck = 0 Auto
{Optional: The quest must be this stage or higher to set the stage when OnAdd is fired. Default: 0 = no minimum}

Int Property MaxStageToCheck = 0 Auto
{Optional: The quest must be this stage or lower to set the stage when OnAdd is fired. Default: 0 = no maximum}

bool Property CheckPlayerInventory = True Auto
{Optional: True = set stage when item is added to the player's inventory. Default: true}

ObjectReference Property CheckThisInventory Auto
{Optional: Set stage when item is added to this object reference's inventory. Default: None}

ReferenceAlias Property CheckThisAliasInventory Auto
{Optional: Set stage when item is added to the inventory of the object reference in this alias. Default: None}

Bool Property TraceEvent = false Auto
{Optional: Do you want to generate a trace to the logs OnContainerChanged event? Default: False}

Event OnInit()
	if TraceEvent
; 		debug.trace(self + "OnInit()")
	EndIf

EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if TraceEvent
; 		debug.trace(self + "OnContainerChanged(akNewContainer[" + akNewContainer + "], akOldContainer[" + akOldContainer + "])" )
	EndIf

	Quest myQuest = GetOwningQuest()
	int myStage = myQuest.GetStage()
	
	bool DoSetStage = false
	
	if myQuest.GetStageDone(StageToSet) == 0 && myStage >= MinStageToCheck
		if (MaxStageToCheck > 0 && myStage <= MaxStageToCheck) || MaxStageToCheck <= 0
			if CheckPlayerInventory && Game.GetPlayer() == akNewContainer
				DoSetStage = true
			EndIf
			if CheckThisInventory && CheckThisInventory == akNewContainer
				DoSetStage = true
			EndIf
			if CheckThisAliasInventory && CheckThisAliasInventory.GetReference() == akNewContainer
				DoSetStage = true
			EndIf
		EndIf
	EndIf

	if DoSetStage
		if TraceEvent
; 			debug.trace(self + "OnContainerChanged() setting myQuest " + myQuest + " stage to " + StageToSet )
		EndIf
		myQuest.setstage(stageToSet)
	EndIf
	
EndEvent
