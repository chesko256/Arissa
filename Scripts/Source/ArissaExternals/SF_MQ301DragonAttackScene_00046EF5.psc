;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname SF_MQ301DragonAttackScene_00046EF5 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; reset starting trigger when scene ends
(GetOwningQuest() as MQ301Script).ResetDragonAttackScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Debug.Trace("MQ301DragonAttackScene: initial attack package complete")
(GetOwningQuest() as MQ301Script).AdvanceDragonAttackScene(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Debug.Trace("MQ301DragonAttackScene: phase 1 complete")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

