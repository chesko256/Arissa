;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_DialogueRiverwoodIntroScen_000954D9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sven
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hilde
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hilde Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; MQ102A sets this when OK to advance the scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has triggered scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; failsafe
setstage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HildeScene  Auto  
