;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_CW01_000D517A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit12
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit15
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fort
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Fort Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit25
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit25 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit19
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit22
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit22 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rikke
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Rikke Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit10
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit17
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tullius
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Tullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit14
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit23
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit23 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit13
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit9
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit24
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit24 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit21
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit21 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit16
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit8
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit11
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit20
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit18
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit18 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CW01Script
Quest __temp = self as Quest
CW01Script kmyQuest = __temp as CW01Script
;END AUTOCAST
;BEGIN CODE
;Quick Start
kmyquest.CW00A.setstage(20)
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
;BEGIN AUTOCAST TYPE CW01Script
Quest __temp = self as Quest
CW01Script kmyQuest = __temp as CW01Script
;END AUTOCAST
;BEGIN CODE
;player should take oath
setObjectiveCompleted(100)
setObjectiveDisplayed(160)

;in case the Jagged Crown Scene is still playing:
(kmyquest.CW01SolitudeMapTableScene as CWMapTableSceneScript).StopMyScene()

Alias_Tullius.TryToEvaluatePackage()   ;trigger forcegreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CW01Script
Quest __temp = self as Quest
CW01Script kmyQuest = __temp as CW01Script
;END AUTOCAST
;BEGIN CODE
;player has taken oath

kmyquest.CWs.AddCivilWarAchievment(1)

setObjectiveCompleted(160)
kmyquest.CW01AOutfitImperial.setStage(1)
kmyquest.CW02a.setStage(10)
kmyquest.CW02a.SetActive()

; CWScript.Log("CW01A", "CW01A Stage 200: setting stage 11 in CW quest to add player to the faction")
kmyquest.CWs.setStage(11)

kmyquest.CWs.PlayerTookOath(1)   ;turns off introductory quests and fails the joining the other faction quest

;in case the Jagged Crown Scene is hadn't finished playing:
(kmyquest.CW01SolitudeMapTableScene as CWMapTableSceneScript).StartMyScene(WaitUntilSceneCompletes = true)

kmyquest.CWs.CWAlliesS.MakeHadvarAndRalofPotentialAllies()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CW01Script
Quest __temp = self as Quest
CW01Script kmyQuest = __temp as CW01Script
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(1)

kmyquest.CWs.CWGarrisonEnableMarkerSonsCampFalkreath.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
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
;scene in CW01SolitudeMapTableScene about the Jagged Crown is finished - Rikke will talk to player
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
