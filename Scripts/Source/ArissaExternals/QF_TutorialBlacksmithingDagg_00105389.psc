;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_TutorialBlacksmithingDagg_00105389 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Clear objective
; debug.trace(self + "player has smithed a dagger")
TutorialBlacksmithing.SetStage(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TutorialBlacksmithing  Auto  
