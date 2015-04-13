;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname SF_C02InductionScene_0007165F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Game.EnablePlayerControls()
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
C01.SetObjectiveCompleted(110, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property C01  Auto  
