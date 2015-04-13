;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_MGRAppOnmund01_0006BC33 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Staff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Staff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Onmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Onmund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enthir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enthir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Amulet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Amulet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StaffContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StaffContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StaffLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StaffLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_LocationMapMarker.GetReference().AddtoMap()
If (Game.GetPlayer().GetItemCount(Alias_Staff.GetReference()) > 0)
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(40)
Game.GetPlayer().RemoveItem(Alias_Amulet.GetReference(),1)
Alias_Onmund.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
Game.GetPlayer().AddItem(Alias_Amulet.GetReference(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
