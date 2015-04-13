;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MS13BleakFallsBarrowLeverS_0003AC44 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BleakFallsBarrow
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BleakFallsBarrow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DartVictim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DartVictim Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE QF_MS13BleakFallsBarrowLeverS_0003AC44
Quest __temp = self as Quest
QF_MS13BleakFallsBarrowLeverS_0003AC44 kmyQuest = __temp as QF_MS13BleakFallsBarrowLeverS_0003AC44
;END AUTOCAST
;BEGIN CODE
LeverSceneDone = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MS13LeverScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property LeverSceneDone = 0 Auto  

Scene Property MS13LeverScene  Auto  
