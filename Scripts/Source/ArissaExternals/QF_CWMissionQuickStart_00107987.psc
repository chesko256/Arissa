;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_CWMissionQuickStart_00107987 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;start CWMission07 for the imperials

kmyquest.CW.setStage(1)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.PaleHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 1)
kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 1)
kmyquest.CW.CWMission07Done = 0

kmyquest.CW.CW00A.stop()
kmyquest.CW.CW01A.stop()

ObjectReference CampMapMarker = kmyquest.MilitaryCampRiftImperialMapMarker
kmyquest.RikkeRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;fort battle in Reach

;start CWMission07 for the stormcloaks
kmyquest.CW.setStage(2)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.FalkreathHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.CWMission07Done = 1

kmyquest.CW.CW00B.stop()
kmyquest.CW.CW01B.stop()

ObjectReference CampMapMarker = kmyquest.MilitaryCampReachSonsMapMarker
kmyquest.GalmarRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;start CWMission07 for the stormcloaks

kmyquest.CW.setStage(2)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.FalkreathHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.CWMission07Done = 0

kmyquest.CW.CW00B.stop()
kmyquest.CW.CW01B.stop()

ObjectReference CampMapMarker = kmyquest.MilitaryCampReachSonsMapMarker
kmyquest.GalmarRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;start CWMission03 for the stormcloaks

kmyquest.CW.setStage(2)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.ReachHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.FalkreathHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.CWMission03Done = 0

kmyquest.CW.CW00B.stop()
kmyquest.CW.CW01B.stop()

ObjectReference CampMapMarker = kmyquest.MilitaryCampHjaalmarchSonsMapMarker
kmyquest.GalmarRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;start CWMission04 for the stormcloaks

kmyquest.CW.setStage(2)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 2)
kmyquest.CW.CWMission04Done = 0

kmyquest.CW.CW00B.stop()
kmyquest.CW.CW01B.stop()

kmyquest.CWGarrisonEnableMarkerSonsCampFalkreath.enable()  ;Falkreath is disabled at start of game due to proximity to Helgen

ObjectReference CampMapMarker = kmyquest.MilitaryCampFalkreathSonsMapMarker
kmyquest.GalmarRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CWMissionQuickstartScript
Quest __temp = self as Quest
CWMissionQuickstartScript kmyQuest = __temp as CWMissionQuickstartScript
;END AUTOCAST
;BEGIN CODE
;fort battle in Pale

;start mission for the Imperials
kmyquest.CW.setStage(1)
kmyquest.CW.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
kmyquest.CW.WhiterunSiegeFinished = 1

kmyquest.CW.WhiterunHoldLocation.SetKeyWordData(kmyquest.CW.CWOwner, 1)
kmyquest.CW.CWMission03Done = 1

kmyquest.CW.CW00A.stop()
kmyquest.CW.CW01A.stop()

ObjectReference CampMapMarker = kmyquest.MilitaryCampPaleImperialMapMarker
kmyquest.RikkeRef.MoveTo(CampMapMarker)
Game.GetPlayer().MoveTo(CampMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
