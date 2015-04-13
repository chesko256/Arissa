;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_MQ302Test_0004BA68 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; call this to favor Sons of Skyrim
(MQ302 as MQ302Script).IncrementNegotiationDelta(-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; Winterhold
(CW as CWScript).SetHoldOwnerByInt(7, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; the Pale
(CW as CWScript).SetHoldOwnerByInt(6, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Falkreath
(CW as CWScript).SetHoldOwnerByInt(5, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Whiterun
(CW as CWScript).SetHoldOwnerByInt(4, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; switch side to change control to
Owner = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; Hjaalmarch
(CW as CWScript).SetHoldOwnerByInt(3, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Haafingar
(CW as CWScript).SetHoldOwnerByInt(1, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; the Rift
(CW as CWScript).SetHoldOwnerByInt(9, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Reach
(CW as CWScript).SetHoldOwnerByInt(2, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; call this to favor Imperials
(MQ302 as MQ302Script).IncrementNegotiationDelta(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; Eastmarch
(CW as CWScript).SetHoldOwnerByInt(8, Owner, DiplomaticVictory = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; switch side to change control to
Owner = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ302  Auto  

Quest Property CW  Auto  

int Property Owner  Auto  

LocationAlias Property ImperialTownRaided  Auto  

LocationAlias Property SonsTownRaided  Auto  
