;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_CR06_000C18E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gewgaw
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gewgaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpawnChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationHold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_LocationHold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CR06QuestScript
Quest __temp = self as Quest
CR06QuestScript kmyQuest = __temp as CR06QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR06QuestScript
Quest __temp = self as Quest
CR06QuestScript kmyQuest = __temp as CR06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CR06QuestScript
Quest __temp = self as Quest
CR06QuestScript kmyQuest = __temp as CR06QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CR06QuestScript
Quest __temp = self as Quest
CR06QuestScript kmyQuest = __temp as CR06QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
