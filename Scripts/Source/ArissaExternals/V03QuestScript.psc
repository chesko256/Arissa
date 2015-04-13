Scriptname V03QuestScript extends Quest  


Event OnUpdate()

  ;SetStage when player has made it to Solitude
  
  If V03.GetCurrentStageID() == 50 && Game.GetPlayer().IsInLocation(Pinemoon)
	V03.SetStage(100)
  EndIf


EndEvent

Location Property Pinemoon Auto

Quest Property V03 Auto