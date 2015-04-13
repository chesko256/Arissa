;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformMarkarthJ_000790E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Potion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Potion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player talks to the Steward
SetObjectiveCompleted(10, 1)

Alias_Steward.GetActorRef().AddItem(Alias_Potion.GetRef())
Game.GetPlayer().AddItem(FavorRewardGoldSmall)

;Player is now Bothela's friend
Alias_QuestGiver.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Bothela asks the player for help
SetObjectiveDisplayed(10, 1)

Alias_Potion.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_Potion.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

LeveledItem Property FavorRewardGoldSmall  Auto  
