;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DBRecurringIntroMisc_00097255 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DBRecurringIntroMiscScript
Quest __temp = self as Quest
DBRecurringIntroMiscScript kmyQuest = __temp as DBRecurringIntroMiscScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB07.SetStage (200)
kmyQuest.DB08.SetStage (200)
kmyQuest.DB09.SetStage (200)
kmyQuest.DB10.SetStage (200)
kmyQuest.DB11.SetStage (80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DBRecurringIntroMiscScript
Quest __temp = self as Quest
DBRecurringIntroMiscScript kmyQuest = __temp as DBRecurringIntroMiscScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (200)
kmyQuest.DB05.SetStage (200)
kmyQuest.DB06.SetStage (200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property pContractStage  Auto Conditional 
