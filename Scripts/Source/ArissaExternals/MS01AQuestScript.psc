ScriptName MS01AQuestScript extends Quest Conditional

;Variable to track Omluag and Hathrasil's scene
Int property OmluagScene auto conditional

;Variable to track if Eltrys has asked the player to bring him the smelter plans
Int property EltrysTalked auto conditional

MiscObject property SluiceKey auto
Quest property MS01A auto
Quest Property MS01  Auto  

Event OnUpdate()
  ;set stage when player has the plans
  If (Game.GetPlayer().GetItemCount(SluiceKey) == 1) && (MS01A.GetStage() == 10)
	MS01A.SetStage(20)
  EndIf
EndEvent
