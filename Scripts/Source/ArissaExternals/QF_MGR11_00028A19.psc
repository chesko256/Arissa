;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_MGR11_00028A19 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGR11GemType
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MGR11GemType Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MGRShellScript MGR = MGRShell as MGRShellScript
MGR.StartSergiusQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Questgiver.GetActorReference().ModFavorPoints(FavorRewardSmall.GetValueInt())
MGRShellScript MGR = MGRShell as MGRShellScript
MGR.StartSergiusQuest()
MGR.pMGR11Done = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property MGRShell  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

