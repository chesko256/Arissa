scriptName MS01QuestScript extends Quest conditional

;Variable to track the end of the intial quest scene
Int Property MS01SceneDone auto conditional

;Variable to tell when Eltrys has reached the Shrine of Talos
Int Property EltrysAtShrine auto conditional

;Variable to count how many conspirators the player has dealt with
Int Property ConspiratorCount auto conditional

;Variable to track time after Eltrys tells the player to wait a day
Float Property EltrysDaysPassed auto conditional

;Variable to trigger the guard ambush when the player meets Eltrys
Int Property GuardAmbush auto conditional

;Variable to track if the player is a wanted Forsworn in Markarth
Int Property MarkarthWanted auto conditional

;Variable to track when sellers can bark
Int Property MarkarthMarket Auto Conditional

Quest Property MS01 auto
GlobalVariable Property GameDaysPassed auto
ReferenceAlias Property Eltrys auto
ObjectReference Property ShrineofTalos auto
Keyword Property MS01GuardAmbush  Auto  

Event OnUpdate()
  ;Check if the player has Omluag's room key
  If (GetStageDone(15) == 1) && (Game.GetPlayer().GetItemCount(pOmluagRoomKey) >= 1)
    SetStage(17)
  EndIf


  ;trigger the last scene of the quest when the player waits a day to see Eltrys
  If (MS01.GetStage() == 30) && ((EltrysDaysPassed - GameDaysPassed.Value) <= 0) && (Eltrys.GetActorReference().IsDead() == False)
    ;move poor Eltrys and kill him
	Eltrys.GetReference().Moveto(ShrineofTalos)
	Eltrys.GetActorReference().Kill()
	GuardAmbush = 1
  EndIf
EndEvent

Function ConspiratorCount()
	ConspiratorCount = ConspiratorCount + 1
	If (ConspiratorCount == 3)
		MS01.SetStage(20)
	EndIf
EndFunction

Key Property pOmluagRoomKey  Auto  
