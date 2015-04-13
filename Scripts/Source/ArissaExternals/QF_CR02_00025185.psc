;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_CR02_00025185 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DenHold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_DenHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AnimalDen
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AnimalDen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BeastBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
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
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
;END AUTOCAST
;BEGIN CODE
;Boss is dead.
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR02QuestScript
Quest __temp = self as Quest
CR02QuestScript kmyQuest = __temp as CR02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
