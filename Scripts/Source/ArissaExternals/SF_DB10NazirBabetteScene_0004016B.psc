;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB10NazirBabetteScene_0004016B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Game.EnablePlayerControls()
pNightMotherAstridScene.Start()
NMCoffinBlackIS.ApplyCrossfade(1)
;DB10.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pNightMotherAstridScene  Auto  

Quest Property DB10  Auto  
ImagespaceModifier property NMCoffinFadeIS Auto
ImagespaceModifier property NMCoffinBlackIS Auto
