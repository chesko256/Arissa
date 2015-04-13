;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_MQ201LeavePartyScene_000361F2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
GetOwningQuest().SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; debug.trace(self + " END")
MalbornGoodbyeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; debug.trace(self + " START")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MalbornGoodbyeScene  Auto  
