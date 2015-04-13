;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DarkwaterCrossingDerkeethu_00076B4A Extends Quest Hidden

;BEGIN ALIAS PROPERTY DerkeethusSpot
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DerkeethusSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DarkwaterExit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DarkwaterExit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DarkwaterExitTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DarkwaterExitTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DarkwaterCavern
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_DarkwaterCavern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DarkwaterExitTrigger2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DarkwaterExitTrigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Derkeethus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Derkeethus Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Debug.TraceStack("DERKEETHUS: Who is calling this?!")
SetObjectiveCompleted(20, 1)

Alias_Derkeethus.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DarkwaterDerkeethusRescueScript
Quest __temp = self as Quest
DarkwaterDerkeethusRescueScript kmyQuest = __temp as DarkwaterDerkeethusRescueScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
