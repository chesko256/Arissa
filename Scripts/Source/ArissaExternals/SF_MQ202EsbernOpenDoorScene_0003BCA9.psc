;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_MQ202EsbernOpenDoorScene_0003BCA9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; close (and lock?) door
GetOwningQuest().SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
QSTEsbernLocks03.Play(Alias_Esbern.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
QSTEsbernLocks01.Play(Alias_Esbern.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
QSTEsbernLocks02.Play(Alias_Esbern.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTEsbernLocks01  Auto  

Sound Property QSTEsbernLocks02  Auto  

Sound Property QSTEsbernLocks03  Auto  

ReferenceAlias Property Alias_Esbern  Auto  
