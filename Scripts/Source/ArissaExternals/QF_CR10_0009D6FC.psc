;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_CR10_0009D6FC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Camp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Camp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampTreasureMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CampTreasureMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Plans
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Plans Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CR10QuestScript
Quest __temp = self as Quest
CR10QuestScript kmyQuest = __temp as CR10QuestScript
;END AUTOCAST
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR10QuestScript
Quest __temp = self as Quest
CR10QuestScript kmyQuest = __temp as CR10QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR10QuestScript
Quest __temp = self as Quest
CR10QuestScript kmyQuest = __temp as CR10QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR10QuestScript
Quest __temp = self as Quest
CR10QuestScript kmyQuest = __temp as CR10QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CR10QuestScript
Quest __temp = self as Quest
CR10QuestScript kmyQuest = __temp as CR10QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
