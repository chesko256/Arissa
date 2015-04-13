ScriptName dunMossMotherQuestManager extends ObjectReference
{Script that lives on a TrapLinker outside Moss Mother cavern. Handles updates to the quest as enemies die, and when the player leaves at the end.}

Quest property dunMossMotherQST Auto
{The Moss Mother Cavern quest.}

int property clearedStage Auto
{Stage to set when all the enemies in the cavern are dead.}

int property readyForCompletionStage Auto
{Stage to look for when the area unloads.}

int property completionStage Auto
{Stage to set when the dungeon is completed and unloads.}

Location property MossMotherCavern Auto
{Location form for Moss Mother Cavern.}


;Post-quest, when the area unloads, update the quest to send Valdr home and toggle the dead bodies off.
Event OnUnload()
      if (Game.GetPlayer().GetCurrentLocation() != MossMotherCavern && dunMossMotherQST.GetStage() == readyForCompletionStage)
		dunMossMotherQST.SetStage(completionStage)
	EndIf
EndEvent

;On activation, check if the dungeon is cleared. If so, update the quest.
Event OnActivate(ObjectReference obj)
	if (MossMotherCavern.IsCleared())
		dunMossMotherQST.SetStage(clearedStage)
	EndIf
EndEvent