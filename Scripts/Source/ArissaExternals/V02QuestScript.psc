Scriptname V02QuestScript extends Quest  


Event OnUpdate()

  ;SetStage when player has made it to Solitude
  
  If V02.GetCurrentStageID() == 50 && Game.GetPlayer().IsInLocation(Solitude)
	V02.SetStage(100)
  EndIf


EndEvent

Location Property Solitude Auto

Quest Property V02 Auto