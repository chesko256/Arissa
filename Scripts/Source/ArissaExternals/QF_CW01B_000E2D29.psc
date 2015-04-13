;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_CW01B_000E2D29 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IceWraith
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IceWraith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Galmar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Galmar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CW01BScript
Quest __temp = self as Quest
CW01BScript kmyQuest = __temp as CW01BScript
;END AUTOCAST
;BEGIN CODE
;Quick Start
kmyquest.CW00B.setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player killed all the bandits

setObjectiveCompleted(1)
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player should take oath
setObjectiveCompleted(100)
setObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CW01BScript
Quest __temp = self as Quest
CW01BScript kmyQuest = __temp as CW01BScript
;END AUTOCAST
;BEGIN CODE
;player has taken oath

kmyquest.CWs.AddCivilWarAchievment(1)

Game.GetPlayer().AddItem(kmyquest.CWPlayerUniformSons)

setObjectiveCompleted(160)
kmyquest.CW02B.setStage(10)
kmyquest.CW02B.SetActive()

; CWScript.Log("CW01B", "CW01B Stage 200: setting stage 12 in CW quest to add player to the faction")
kmyquest.CWs.setStage(12)

kmyquest.CWs.PlayerTookOath(2)   ;turns off introductory quests and fails the joining the other faction quest

;in case the Jagged Crown Scene is hadn't finished playing:
(kmyquest.CW01WindhelmMapTableScene as CWMapTableSceneScript).StartMyScene(WaitUntilSceneCompletes = true)

kmyquest.CWs.CWAlliesS.MakeHadvarAndRalofPotentialAllies()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CW01BScript
Quest __temp = self as Quest
CW01BScript kmyQuest = __temp as CW01BScript
;END AUTOCAST
;BEGIN CODE
;NOTE - setup dialogue lives in CW00B, and stage 20 in that quest starts this off

Alias_IceWraith.GetReference().Reset()
setObjectiveDisplayed(1)

kmyquest.CWs.CWGarrisonEnableMarkerSonsCampFalkreath.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CW01BScript
Quest __temp = self as Quest
CW01BScript kmyQuest = __temp as CW01BScript
;END AUTOCAST
;BEGIN CODE
;FAIL QUEST

;player swore oath on the other side -- see PlayerTookOath() in CWScript
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;scene in CW01WindhelmMapTableScene about the Jagged Crown is finished - Galmar will talk to player
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
