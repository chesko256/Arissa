ScriptName MS13ArvelsJournalScript Extends ReferenceAlias

Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
;     Debug.Trace("MS13ArvelJournal was equipped by the player")
	If (GetOwningQuest().GetStageDone(10) == 0)
	  GetOwningQuest().SetStage(37)
	EndIf
  endIf
endEvent

Event OnActivate(ObjectReference akActionRef)
  if akActionRef == Game.GetPlayer()
;     Debug.Trace("MS13ArvelJournal was activated up by the player")
	If (GetOwningQuest().GetStageDone(10) == 0)
	  GetOwningQuest().SetStage(37)
	EndIf
  endIf
endEvent