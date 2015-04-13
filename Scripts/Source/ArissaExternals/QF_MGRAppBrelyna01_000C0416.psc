;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_MGRAppBrelyna01_000C0416 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Creature2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Creature2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Creature3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Creature3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Creature1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Creature1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
CompleteAllObjectives()
Alias_Questgiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Game.GetPlayer().AddItem(LItemEnchNecklace,1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Race Property SkeletonRace  Auto  

scene Property Scene01  Auto  

scene Property Scene02  Auto  

LeveledItem Property LItemEnchNecklace  Auto  
