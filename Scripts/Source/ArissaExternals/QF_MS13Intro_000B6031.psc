;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_MS13Intro_000B6031 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Camilla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Camilla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lucan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lucan Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Quest is complete
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Turn on the objective
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
