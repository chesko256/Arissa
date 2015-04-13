;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_MS12b_0002499C Extends Quest Hidden

;BEGIN ALIAS PROPERTY LetterFromQuintus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterFromQuintus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingredient2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingredient2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeartChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BriarHeartChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Quintus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Quintus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingredient1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingredient1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingredient3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingredient3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BHW
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BHW Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nurelion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nurelion Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MS12bQuestScript
Quest __temp = self as Quest
MS12bQuestScript kmyQuest = __temp as MS12bQuestScript
;END AUTOCAST
;BEGIN CODE
;Utility.Wait(kmyQuest.CourierDelayInDays)
; Debug.Trace("MS12: Starting followup quest.")

kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS12bQuestScript
Quest __temp = self as Quest
MS12bQuestScript kmyQuest = __temp as MS12bQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(30, 1)
SetObjectiveDisplayed(40, 1)
SetObjectiveDisplayed(50, 1)

kmyQuest.FixEarlyCollection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Snowbank.Enable()
Alias_Ingredient2.GetRef().Enable()
Alias_LetterQuestItem.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE MS12bQuestScript
Quest __temp = self as Quest
MS12bQuestScript kmyQuest = __temp as MS12bQuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
Alias_Quintus.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
Alias_Quintus.GetActorRef().AddToFaction(MarriageFaction)
SetObjectiveCompleted(60, 1)

QuintusEssentialOnMS12Prime.Clear()
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MajorFavor  Auto  

ReferenceAlias Property QuintusEssentialOnMS12Prime  Auto  

ObjectReference Property Snowbank  Auto  

Faction Property MarriageFaction  Auto  

AchievementsScript Property AchievementsQuest  Auto  
