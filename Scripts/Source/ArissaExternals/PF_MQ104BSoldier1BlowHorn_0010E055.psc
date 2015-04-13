;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_MQ104BSoldier1BlowHorn_0010E055 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; debug.trace(self + "ON END")
bool flag  = akActor.PlayIdle(IdleBlowHornStormcloak)
; debug.trace(self + " success = " + flag)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; debug.trace(self + "ON BEGIN")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleBlowHornStormcloak  Auto  
