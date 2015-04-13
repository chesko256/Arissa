;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FreeformFalkreathQuest03_000B83C3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dengeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dengeir Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Vighar the vampire is dead, return to Jarl

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE FreeformFalkreathQuest03Script
Quest __temp = self as Quest
FreeformFalkreathQuest03Script kmyQuest = __temp as FreeformFalkreathQuest03Script
;END AUTOCAST
;BEGIN CODE
;Quest accepted

VigharQuest.setObjectiveDisplayed(10)
kmyQuest.LairMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE FreeformFalkreathQuest03Script
Quest __temp = self as Quest
FreeformFalkreathQuest03Script kmyQuest = __temp as FreeformFalkreathQuest03Script
;END AUTOCAST
;BEGIN CODE
; Quest is over

SetObjectiveCompleted(20)
Game.GetPlayer().AddItem(kmyQuest.Gold001, 200)
Alias_Dengeir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property VigharQuest  Auto  
