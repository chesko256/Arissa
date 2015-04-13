;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DA02KillObj_00052795 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Elisif
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elisif Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace("DA02KillObj stage 200: Complete Quest, stop()")
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
