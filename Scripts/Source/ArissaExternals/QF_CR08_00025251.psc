;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname QF_CR08_00025251 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimHomeMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VictimHomeMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ProtectedVictim
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ProtectedVictim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lair
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Lair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimHomeCenter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VictimHomeCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimHome
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_VictimHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LairMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LairMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(25, 1)

kmyQuest.RewardAmount = 0
kmyQuest.Finished()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
CompleteAllObjectives()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player has been offered quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
; reached home

SetObjectiveCompleted(21, 1)
SetObjectiveDisplayed(22, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.PrematureShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
if (!IsObjectiveCompleted(10))
	SetObjectiveFailed(10, 1)
endif
if (!IsObjectiveCompleted(20))
	SetObjectiveFailed(20, 1)
endif
if (!IsObjectiveCompleted(21))
	SetObjectiveFailed(21, 1)
endif
if (!IsObjectiveCompleted(22))
	SetObjectiveFailed(22, 1)
endif

SetObjectiveDisplayed(25)

kmyQuest.Finished(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
; head back to companions

SetObjectiveCompleted(22, 1)
SetObjectiveDisplayed(25, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR08QuestScript
Quest __temp = self as Quest
CR08QuestScript kmyQuest = __temp as CR08QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Escorting home.

SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(21, 1)
Alias_VictimHomeMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
