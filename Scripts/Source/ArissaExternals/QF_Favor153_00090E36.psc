;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_Favor153_00090E36 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantCamp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GiantCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(15, 1)
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
;shut down the favor
;Note you don't need to complete objectives or Stop the quest. 
;The FavorShutDown function handles that
kmyQuest.FavorShutDown()
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
;The FavorAccepted function handles the actor variable and timer for the favor system
;Note that you don't need SetObjectiveDisplayed here, the function does that on it's own
kmyquest.FavorAccepted()

Alias_MapMarker.GetRef().AddtoMap()
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
; player completes the favor successfully
Alias_QuestGiver.GetActorReference().RemoveFromFaction(Favor153QuestGiverFaction)

Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)


SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorControlQuest  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property Favor154QuestGiverFaction  Auto  

LeveledItem Property FavorRewardEnchWeapon  Auto  

LeveledItem Property FavorRewardEnchArmor  Auto  

Faction Property Favor153QuestGiverFaction  Auto  
