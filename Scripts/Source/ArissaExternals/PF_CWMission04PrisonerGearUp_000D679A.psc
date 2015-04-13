;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname PF_CWMission04PrisonerGearUp_000D679A Extends Package Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(Actor akActor)
;BEGIN CODE
; debug.trace(self + "On End, calling PrisonerGearUp(" + akActor + ")")
(GetOwningQuest() as CWMission04Script).PrisonerGearUp(akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
