;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_CR01_0001CEEE Extends Quest Hidden

;BEGIN ALIAS PROPERTY BeastVictim
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BeastVictim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner07
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner10
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastHouseMainDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BeastHouseMainDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beast
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Beast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VictimMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BeastMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner08
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner09
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastHouse
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_BeastHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimHometown
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_VictimHometown Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner06
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Homeowner04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWatching
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PlayerWatching Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE CR01QuestScript
Quest __temp = self as Quest
CR01QuestScript kmyQuest = __temp as CR01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CR01QuestScript
Quest __temp = self as Quest
CR01QuestScript kmyQuest = __temp as CR01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR01QuestScript
Quest __temp = self as Quest
CR01QuestScript kmyQuest = __temp as CR01QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CR01QuestScript
Quest __temp = self as Quest
CR01QuestScript kmyQuest = __temp as CR01QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CR01QuestScript
Quest __temp = self as Quest
CR01QuestScript kmyQuest = __temp as CR01QuestScript
;END AUTOCAST
;BEGIN CODE
;Beast is dead.
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
