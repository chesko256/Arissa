;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DialogueRiftenSS05_0005CE25 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KeeravaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeeravaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TalenJeiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TalenJeiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaramalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MaramalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RDSQuestScript
Quest __temp = self as Quest
RDSQuestScript kmyQuest = __temp as RDSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.pRDSGlobal.Value = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
