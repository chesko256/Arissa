;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_TGJarl_0010E3E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGJarlBalgruufAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGJarlBalgruufAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Initiate Relationship with Balgruuf for TGTQ03
Alias_TGJarlBalgruufAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(),2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
