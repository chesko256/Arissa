;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_TG08AOathScene_00058EED Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pMainFX.PlayAnimation("playanim02")
pTG08imod.ApplyCrossfade(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().SetStage(57)
pColumnFX.PlayAnimation("playanim01")
pMainFX.PlayAnimation("playanim01")
ImageSpaceModifier.RemoveCrossfade(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
pColumnFX.PlayAnimation("playanim02")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMainFX  Auto  
ObjectReference Property pColumnFX Auto
ImageSpaceModifier Property pTG08imod  Auto  
