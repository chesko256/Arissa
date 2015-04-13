;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF_TG04SP_00050763 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gulum_EiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gulum_EiAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Scene Completed Properly (No Repeat)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug and Quest Setup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG04SPQuestScript
Quest __temp = self as Quest
TG04SPQuestScript kmyQuest = __temp as TG04SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Start Scene
kmyQuest.pTG04Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pTG04GulumEiFaction  Auto  
