;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_E3demoDragon01AttackScene_000B2843 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
QF_E3demo_00093637 E3demo = getOwningQuest() as QF_E3demo_00093637
e3demo.Alias_Dragon01.getActorReference().startCombat(e3demo.Alias_Giant01.getActorReference())
; debug.trace("[E3demo] end of dragon 01 scene Phase 2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace("[E3demo] start dragon 01 intro scene")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
