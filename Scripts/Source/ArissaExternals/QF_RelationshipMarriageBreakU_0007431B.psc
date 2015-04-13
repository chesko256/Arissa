;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_RelationshipMarriageBreakU_0007431B Extends Quest Hidden

;BEGIN ALIAS PROPERTY LoveInterest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveInterest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player and the Love Interest have broken up
Alias_LoveInterest.GetActorReference().RemoveFromFaction(RelationshipCourtingFaction)
RelationshipMarriage.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player and the Love Interest have reconciled
Alias_LoveInterest.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 3)
Alias_LoveInterest.GetActorReference().AddtoFaction(RelationshipCourtingFaction)
RelationshipMarriage.SetStage(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has blown off the Love Interest
Alias_LoveInterest.GetActorReference().SetRelationshipRank(Game.GetPlayer(), -2)
Alias_LoveInterest.GetActorReference().AddToFaction(MarriageExcludedFaction)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property MarriageExcludedFaction  Auto  

Faction Property RelationshipCourtingFaction  Auto  

GlobalVariable Property FavorReward  Auto  

GlobalVariable Property FavorCost  Auto  

Quest Property RelationshipMarriage  Auto  
