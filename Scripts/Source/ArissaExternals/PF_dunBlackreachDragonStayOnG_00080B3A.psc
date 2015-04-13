;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_dunBlackreachDragonStayOnG_00080B3A Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
; keep dragon on ground
;akActor.SetAllowFlying(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; keep dragon on ground
akActor.SetAllowFlying(false)
akActor.addSpell(abDragonFlightless)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property abDragonFlightless  Auto  
