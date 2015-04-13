;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_Favor157_000A3504 Extends Quest Hidden

;BEGIN ALIAS PROPERTY House
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_House Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
;Kill the QuestItem if the player has never retrieved it.
If GetStageDone(15) == 0
  Alias_BossContainer.GetReference().RemoveItem(Alias_QuestItem.GetReference(), 1)
EndIf

;shut down the favor
;Note you don't need to complete objectives or Stop the quest. 
;The FavorShutDown function handles that
kmyQuest.FavorShutDown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_QuestGiver.GetActorReference().RemoveFromFaction(Favor157QuestGiverFaction)
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
Alias_QuestGiver.GetActorRef().AddItem(Alias_QuestItem.GetRef())
Game.GetPlayer().AddItem(FavorRewardGoldLarge)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
;enable the quest item and put it in the container
Alias_QuestItem.GetRef().Enable()
Alias_BossContainer.GetRef().AddItem(Alias_QuestItem.GetRef())

;The FavorAccepted function handles the actor variable and timer for the favor system
;Note that you don't need SetObjectiveDisplayed here, the function does that on it's own
kmyquest.FavorAccepted()

Alias_MapMarker.GetRef().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player has the item
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Actor event has fired, run the favor start up function
kmyquest.FavorStartUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

GlobalVariable Property FavorCost  Auto  

Faction Property FavorCompletedFaction  Auto  

Faction Property Favor204QuestGiverFaction  Auto  

Faction Property Favor157QuestGiverFaction  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
