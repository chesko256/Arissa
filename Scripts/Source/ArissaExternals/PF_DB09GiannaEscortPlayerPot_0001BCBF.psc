;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_DB09GiannaEscortPlayerPot_0001BCBF Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;Utility.Wait(1)
; ; debug.trace(self + " OnBegin")
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
