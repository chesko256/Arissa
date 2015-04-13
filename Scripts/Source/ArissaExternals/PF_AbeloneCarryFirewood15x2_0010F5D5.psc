;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_AbeloneCarryFirewood15x2_0010F5D5 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnChange")
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnBegin")
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
