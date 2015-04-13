;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_MS11b_00020556 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Wuunferth
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Wuunferth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calixto
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Calixto Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AuthorityFigure
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AuthorityFigure Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StoneQuarterSpot
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StoneQuarterSpot Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug stage to start the scene

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RealQuest.SetStage(105)

KickoffScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RealQuest Auto

Scene Property KickoffScene  Auto  
