;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_Favor019_0003F4EC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TargetHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiverHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_QuestGiverHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetHouseContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetHouseContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
;The FavorAccepted function handles the actor variable and timer for the favor system
;Note that you don't need SetObjectiveDisplayed here, the function does that on it's own
kmyquest.FavorAccepted()

;Enable and give player the quest item
Alias_QuestItem.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_QuestItem.GetRef())
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
;Activate Actor event has fired, run the favor start up function
kmyquest.FavorStartUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has put the favor item in the container
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
; player completes the favor successfully
Alias_QuestGiver.GetActorReference().RemoveFromFaction(Favor019QuestGiverFaction)
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player rats out the quest giver
Alias_QuestGiver.GetActorReference().RemoveFromFaction(Favor019QuestGiverFaction)
Alias_QuestGiver.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Target.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

SetStage(200)
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
;Disable the Quest Item if the player never accepted the quest
If GetStageDone(10) == 0
  Alias_QuestItem.GetRef().Disable()
EndIf

;shut down the favor
;Note you don't need to complete objectives or Stop the quest. 
;The FavorShutDown function handles that
kmyQuest.FavorShutDown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property FavorCompletedFaction  Auto  

Faction Property Favor114QuestGiverFaction  Auto  

Faction Property Favor019QuestGiverFaction  Auto  
