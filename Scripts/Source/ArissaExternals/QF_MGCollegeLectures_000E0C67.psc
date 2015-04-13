;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_MGCollegeLectures_000E0C67 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Phinis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Phinis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mirabelle
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Mirabelle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Colette
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Colette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arniel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arniel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirya
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Nirya Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Drevis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Drevis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolfdir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Tolfdir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faralda
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enthir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Enthir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ancano
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ancano Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MGCollegeLecturesQuestScript
Quest __temp = self as Quest
MGCollegeLecturesQuestScript kmyQuest = __temp as MGCollegeLecturesQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterforUpdate(30)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
