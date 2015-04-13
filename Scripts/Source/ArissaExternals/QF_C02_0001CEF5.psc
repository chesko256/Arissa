;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_C02_0001CEF5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hagraven2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA05Hagraven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA05Hagraven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kodlak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilCovenMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilCovenMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHandTwo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHandTwo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilCoven
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GlenmorilCoven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BackDoor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BackDoor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHandThree
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHandThree Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerChair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerChair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VilkasSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VilkasSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHandOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHandOne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BackDoor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BackDoor1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE C04QuestScript
Quest __temp = self as Quest
C04QuestScript kmyQuest = __temp as C04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutdownRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE C04QuestScript
Quest __temp = self as Quest
C04QuestScript kmyQuest = __temp as C04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)

Faction comps = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompanionsFaction
;Game.GetPlayer().ModFactionRank(comps, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE C04QuestScript
Quest __temp = self as Quest
C04QuestScript kmyQuest = __temp as C04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
SetObjectiveDisplayed(25, 1)

kmyQuest.SetupCoven()
Alias_GlenmorilCovenMarker.GetReference().AddToMap()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Aela.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE C04QuestScript
Quest __temp = self as Quest
C04QuestScript kmyQuest = __temp as C04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE C04QuestScript
Quest __temp = self as Quest
C04QuestScript kmyQuest = __temp as C04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

kmyQuest.StuffWentDownInJorrvaskr()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property c03  Auto  

Faction Property Companions  Auto  
