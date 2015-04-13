ScriptName FavorQuestItemHandlerScript extends ReferenceAlias
{Script to attach to a quest alias that sets a quest variable whenever the object enters or exits the player's inventory. Used for handling if the player has dropped, sold, or destroyed a Quest Item created for a favor quest.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

FavorQuestScript FavorQuest = GetOwningQuest() as FavorQuestScript

  if (akOldContainer == Game.GetPlayer())
	FavorQuest.PlayerHasQuestItem = 0
;  	Debug.Trace("FavorQuestItem has been dropped by the player.")
  elseif (akNewContainer == Game.GetPlayer())
	FavorQuest.PlayerHasQuestItem = 1
; 	Debug.Trace("FavorQuestItem has been picked up by the player.")
  else
	FavorQuest.PlayerHasQuestItem = 0
; 	Debug.Trace("FavorQuestItem has changed containers, but neither container is the player.")
  endIf

endEvent