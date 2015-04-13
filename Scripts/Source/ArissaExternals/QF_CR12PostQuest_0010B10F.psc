;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_CR12PostQuest_0010B10F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KneelMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_KneelMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR12PostQuestScript
Quest __temp = self as Quest
CR12PostQuestScript kmyQuest = __temp as CR12PostQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
