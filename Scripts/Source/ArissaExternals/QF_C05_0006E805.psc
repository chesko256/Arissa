;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_C05_0006E805 Extends Quest Hidden

;BEGIN ALIAS PROPERTY JorrvaskrInterior
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JorrvaskrInterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HQMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HQMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverHandBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SilverHandBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverHandHQ
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_SilverHandHQ Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWatched
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PlayerWatched Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftShadeInteriorDoor2Reverse
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DriftShadeInteriorDoor2Reverse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftShadeInteriorDoor2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DriftShadeInteriorDoor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftShadeInteriorDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DriftShadeInteriorDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragments
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Fragments Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FragmentSack
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FragmentSack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FragmentSackBox
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FragmentSackBox Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C05QuestScript
Quest __temp = self as Quest
C05QuestScript kmyQuest = __temp as C05QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20, 1)

Faction comps = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompanionsFaction
;Game.GetPlayer().ModFactionRank(comps, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE C05QuestScript
Quest __temp = self as Quest
C05QuestScript kmyQuest = __temp as C05QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(11, 1)

kmyQuest.SetupFort()
FragmentsMarker.Enable()
Alias_HQMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C05QuestScript
Quest __temp = self as Quest
C05QuestScript kmyQuest = __temp as C05QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE C05QuestScript
Quest __temp = self as Quest
C05QuestScript kmyQuest = __temp as C05QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE C05QuestScript
Quest __temp = self as Quest
C05QuestScript kmyQuest = __temp as C05QuestScript
;END AUTOCAST
;BEGIN CODE
FragmentsMarker.Disable()
Game.GetPlayer().AddItem(Alias_FragmentSack.GetRef())

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.GawkersQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


objectreference Property FragmentsMarker  Auto  
