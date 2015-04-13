;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_MG02TolfdirCombatScene_000EA5E8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
MG02TolfdirEyeApproachScene.Start()
Boss.Setactorvalue("variable07", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Boss.Setactorvalue("variable07", 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Boss  Auto  

scene Property MG02TolfdirEyeApproachScene  Auto  
