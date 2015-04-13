;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformIvarstead04_000D9B66 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFI04SackAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI04SackAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI04ChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI04ChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI04KlimmekAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI04KlimmekAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player spoke to Klimmek
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(Alias_FFI04SackAlias.GetRef())
;GlobalValue FFI04Planted monitors if the sack is in the chest or not
;Objective completes in the Script
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().AddItem(pReward)
Alias_FFI04KlimmekAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
SetObjectiveCompleted(20,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  
