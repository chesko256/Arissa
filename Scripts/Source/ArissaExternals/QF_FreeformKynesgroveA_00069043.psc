;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformKynesgroveA_00069043 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player completes the favor successfully
SetObjectiveCompleted(10, 1)
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property FavorCompletedFaction  Auto  

Faction Property Favor108QuestGiverFaction  Auto  

Faction Property Favor110QuestGiverFaction  Auto  

FormList Property Favor110GiftList  Auto  
