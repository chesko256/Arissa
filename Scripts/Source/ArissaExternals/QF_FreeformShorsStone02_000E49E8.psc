;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformShorsStone02_000E49E8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFSS02SylgjaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS02SylgjaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFSS02SylgjaSatchelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS02SylgjaSatchelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFSS02VernerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS02VernerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFSS02VernerSatchelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS02VernerSatchelAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().RemoveItem(Alias_FFSS02VernerSatchelAlias.GetRef())
Game.GetPlayer().AddItem(pReward)
Alias_FFSS02SylgjaAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Failed
if Game.GetPlayer().GetItemCount(Alias_FFSS02SylgjaSatchelAlias.GetRef()) >=  1
Game.GetPlayer().RemoveItem(Alias_FFSS02SylgjaSatchelAlias.GetRef())
endif
if Game.GetPlayer().GetItemCount(Alias_FFSS02VernerSatchelAlias.GetRef()) >= 1
Game.GetPlayer().RemoveItem(Alias_FFSS02VernerSatchelAlias.GetRef())
endif
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Delivery Done!
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().RemoveItem(Alias_FFSS02SylgjaSatchelAlias.GetRef())
Game.GetPlayer().AddItem(Alias_FFSS02VernerSatchelAlias.GetRef())
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Delivery to Darkwater Crossing
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(Alias_FFSS02SylgjaSatchelAlias.GetRef())
pDarkwaterCrossingMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDarkwaterCrossingMapMarker  Auto  

LeveledItem Property pReward  Auto  
