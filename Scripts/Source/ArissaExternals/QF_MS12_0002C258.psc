;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_MS12_0002C258 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ForsakenCaveMapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ForsakenCaveMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NurelionEssential
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NurelionEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Quintus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Quintus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuintusEssential
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuintusEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nurelion
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Nurelion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhitePhialDamaged
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WhitePhialDamaged Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpeningPotion
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OpeningPotion Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

CityApothecaryAlias.ForceRefTo(Alias_Quintus.GetRef())
Alias_Nurelion.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(21, 1)

Alias_Quintus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Game.GetPlayer().AddItem(Alias_OpeningPotion.GetReference())
MS12EnableMarker.Enable()

Alias_ForsakenCaveMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE MS12QuestScript
Quest __temp = self as Quest
MS12QuestScript kmyQuest = __temp as MS12QuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(21, 1)

Alias_Nurelion.GetActorRef().SetGhost(true)

MS12FollowUpStartDay.SetValueInt(GameDaysPassed.GetValueInt() + 3)
;kmyQuest.ShadowQuest.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE MS12QuestScript
Quest __temp = self as Quest
MS12QuestScript kmyQuest = __temp as MS12QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().MoveTo(kmyQuest.StartingPosition)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MS12EnableMarker  Auto  

ReferenceAlias Property CityApothecaryAlias  Auto  

GlobalVariable Property MS12FollowUpStartDay  Auto  

GlobalVariable Property GameDaysPassed  Auto  

AchievementsScript Property AchievementsQuest  Auto  
