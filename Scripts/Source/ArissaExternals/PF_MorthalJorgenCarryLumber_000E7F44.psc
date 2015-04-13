;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PF_MorthalJorgenCarryLumber_000E7F44 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnEnd")
;ObjectReference meRef = akActor as ObjectReference
;(meRef as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnChange")
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnBegin")
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property CarryItem  Auto  
