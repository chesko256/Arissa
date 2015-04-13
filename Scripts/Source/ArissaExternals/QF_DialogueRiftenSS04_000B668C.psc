;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DialogueRiftenSS04_000B668C Extends Quest Hidden

;BEGIN ALIAS PROPERTY JarlAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_JarlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_StewardAlias Auto
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
