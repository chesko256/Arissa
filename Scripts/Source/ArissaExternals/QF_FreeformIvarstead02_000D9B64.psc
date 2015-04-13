;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformIvarstead02_000D9B64 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFI02NarfiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI02NarfiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI02WilhelmAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI02WilhelmAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI02SatchelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI02SatchelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI02NecklaceAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI02NecklaceAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Necklace Picked Up - Return to Narfi
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player spoke to Wilhelm - Find Sister's Remains
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Completed
if IsObjectiveDisplayed(30) == 1
SetObjectiveCompleted(30,1)
endif
Game.GetPlayer().RemoveItem(pNecklaceAlias.GetRef())
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Alias_FFI02NarfiAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player needs to find Narfi's sister - Speak to Wilhelm
SetObjectiveDisplayed(10,1)
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pNecklaceAlias  Auto  

LeveledItem Property pReward  Auto  
