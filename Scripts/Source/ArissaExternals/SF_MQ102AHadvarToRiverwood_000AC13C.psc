;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_MQ102AHadvarToRiverwood_000AC13C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; WAS for failsafe exterior forcegreet. Not needed if forcegreet is always in exterior
; Completion condition:
; GetStageDone MQ102 15 == 1 AND
; GetStageDone MQ102A 20 == 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Riverwood objective
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;WAS: GetStage MQ102A >= 20 (completion condition)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
