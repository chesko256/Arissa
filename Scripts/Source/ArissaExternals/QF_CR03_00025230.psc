;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_CR03_00025230 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SamplePelt
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SamplePelt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SamplePeltSpawnPoint
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SamplePeltSpawnPoint Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
; got pelts
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CR03QuestScript
Quest __temp = self as Quest
CR03QuestScript kmyQuest = __temp as CR03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
