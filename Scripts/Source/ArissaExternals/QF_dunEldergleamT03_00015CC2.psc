;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunEldergleamT03_00015CC2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EldergleamSond
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamSond Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamAsta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamAsta Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BridgeScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has talked to Asta for the first time
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BridgeScene01  Auto  
