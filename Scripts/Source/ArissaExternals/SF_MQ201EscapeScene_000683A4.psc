;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_MQ201EscapeScene_000683A4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
GetOwningQuest().SetStage(222)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace(self + " END")
; unbind Malborn
GetOwningQuest().SetStage(222)
GetOwningQuest().SetStage(223)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " START")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; try again to bind Malborn
Malborn.GetActorRef().PlayIdle(offsetBoundStandingStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



Idle Property offsetBoundStandingStart  Auto  

ReferenceAlias Property Malborn  Auto  
