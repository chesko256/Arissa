;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_CR09_00025252 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Camp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Camp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampBoss
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CampBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CR09QuestScript
Quest __temp = self as Quest
CR09QuestScript kmyQuest = __temp as CR09QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CR09QuestScript
Quest __temp = self as Quest
CR09QuestScript kmyQuest = __temp as CR09QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR09QuestScript
Quest __temp = self as Quest
CR09QuestScript kmyQuest = __temp as CR09QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR09QuestScript
Quest __temp = self as Quest
CR09QuestScript kmyQuest = __temp as CR09QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CR09QuestScript
Quest __temp = self as Quest
CR09QuestScript kmyQuest = __temp as CR09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
