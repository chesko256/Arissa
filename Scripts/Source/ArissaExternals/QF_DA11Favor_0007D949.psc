;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_DA11Favor_0007D949 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalloftheDead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalloftheDead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Glooredhel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Glooredhel Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;pop misc objective
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Player has offered to do a favor
SetObjectiveCompleted(5, 1)
SetObjectiveDisplayed(10, 1)

;Give player the key
Alias_QuestGiver.GetActorRef().RemoveItem(pHalloftheDeadKey, 1)
Game.GetPlayer().AddItem(pHalloftheDeadKey, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player has investigated the Hall of the Dead
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Don't run any more favors on this actor
Alias_QuestGiver.GetActorReference().ModActorValue("FavorActive", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Glooredhel is dead
pDA11.SetStage(200)
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player has completed the favor
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Game.GetPlayer().AddItem(ReligiousArkayLifeDeath, 1)
SetObjectiveCompleted(15, 1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FavorReward  Auto  

Faction Property FavorCompletedFaction  Auto  

Key Property pHalloftheDeadKey  Auto  

Quest Property pDA11  Auto  

LeveledItem Property FavorRewardGold  Auto  

Armor Property ReligiousArkayLifeDeath  Auto  
