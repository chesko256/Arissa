;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_Favor250_000A2C86 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerHousecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerHousecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWeapon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWeapon Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player completes the favor successfully
Alias_QuestGiver.GetActorReference().RemoveFromFaction(Favor250QuestGiverFaction)
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 3)
pFavorJarlsMakeFriends.GetOutofJailCard(Alias_QuestGiver.GetActorRef())
Alias_JarlWeapon.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_JarlWeapon.GetRef())

Alias_PlayerHousecarl.GetActorRef().Enable()
GuestBedroom.Enable()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE FavorChangeLocationQuestScript
Quest __temp = self as Quest
FavorChangeLocationQuestScript kmyQuest = __temp as FavorChangeLocationQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Actor event has fired, run the favor start up function
kmyquest.FavorStartUp()

;remove the quest item from the Jarl
;Alias_QuestGiver.GetActorRef().RemoveItem(Alias_JarlWeapon.GetRef())

;poll to see if the Jarl changes
Alias_QuestGiver.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player owns the house
SetObjectiveCompleted(10, 1)

;Player also has enough friends
If FavorJarlsMakeFriends.GetStageDone(15)
  SetStage(20)
EndIf
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

;track player friends
FavorJarlsMakeFriends.SetStage(10)

;Player already has the house
If HousePurchase.MarkarthHouseVar >= 1
  SetStage(15)
EndIf
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

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorControlQuest  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property Favor050QuestGiverFaction  Auto  

LeveledItem Property FavorGoldReward  Auto  

LeveledItem Property FavorRewardGold  Auto  

LeveledItem Property FavorRewardArmor  Auto  

Faction Property Favor250QuestGiverFaction  Auto  

Quest Property FavorJarlsMakeFriends  Auto  

HousePurchaseScript Property HousePurchase  Auto  

FavorJarlsMakeFriendsScript Property pFavorJarlsMakeFriends  Auto  

ObjectReference Property GuestBedroom  Auto  
