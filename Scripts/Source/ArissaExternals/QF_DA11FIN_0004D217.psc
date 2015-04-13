;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA11FIN_0004D217 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Verulus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Verulus Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Verulus give player reward
Game.GetPlayer().AddItem(FavorRewardGoldLarge)
Alias_Verulus.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Verulus.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Eola has forcegreeted
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
