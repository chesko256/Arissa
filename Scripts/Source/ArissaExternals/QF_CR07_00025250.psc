;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_CR07_00025250 Extends Quest Hidden

;BEGIN ALIAS PROPERTY StartingLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_StartingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationStart
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LocationStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndingLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_EndingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationEnd
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LocationEnd Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Criminal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Criminal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationHold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_LocationHold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CR07QuestScript
Quest __temp = self as Quest
CR07QuestScript kmyQuest = __temp as CR07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR07QuestScript
Quest __temp = self as Quest
CR07QuestScript kmyQuest = __temp as CR07QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR07QuestScript
Quest __temp = self as Quest
CR07QuestScript kmyQuest = __temp as CR07QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR07QuestScript
Quest __temp = self as Quest
CR07QuestScript kmyQuest = __temp as CR07QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
