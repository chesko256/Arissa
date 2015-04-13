;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_CR04_00025231 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brute
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Brute Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BruteActivated
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BruteActivated Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BruteTown
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_BruteTown Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BruteTownMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BruteTownMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(10, 1)
SetObjectiveDisplayed(20, 1)

Alias_BruteActivated.Clear()

kmyQuest.RewardAmount = 50
kmyQuest.Finished(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

Alias_BruteActivated.Clear()

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(10, 1)
SetObjectiveDisplayed(20, 1)

Alias_BruteActivated.Clear()

kmyQuest.RewardAmount = 50
kmyQuest.Finished(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

kmyQuest.Finished()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

kmyQuest.Finished()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR04QuestScript
Quest __temp = self as Quest
CR04QuestScript kmyQuest = __temp as CR04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
