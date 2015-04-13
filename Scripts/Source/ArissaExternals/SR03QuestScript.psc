scriptName SR03QuestScript extends quest

Event OnUpdate()
  ;When the Player picks up the maps, set stage to 20
  If (SR03.GetStage() == 10) && (Game.GetPlayer().GetItemCount(SR03Maps) == 1)
    SR03.Setstage(20)
  EndIf
EndEvent

Quest Property SR03 auto
MiscObject Property SR03Maps auto
MiscObject Property Gold  Auto  
