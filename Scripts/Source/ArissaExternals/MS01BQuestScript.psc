ScriptName MS01BQuestScript extends Quest Conditional

;Variable to track Uaile's and Nepos's scene
Int Property UaileScene auto conditional

;Variable to track if Degaine has told Player about Uraccen
Int Property DegaineTold auto conditional

;Variable to track if Degaine is following the player
Int Property DegaineFollow auto conditional

;Variable to track if Uraccen is free
Int Property UraccenFree auto conditional

Quest property MS01B auto
Location Property MarkarthLocation auto
Scene property UaileNeposScene auto
MiscObject property Poison auto
Quest Property MS01  Auto  

Event OnUpdate()

  ;trigger the scene with Uaile and Nepos
  If (MS01B.GetStage() == 0) && (Game.GetPlayer().GetCurrentLocation() == MarkarthLocation) && (UaileScene == 0)
    UaileNeposScene.Start()
  EndIf

EndEvent