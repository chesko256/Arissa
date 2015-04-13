;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DialogueWhiterunGuardGateS_000D1984 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InteriorGate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InteriorGate Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
WhiterunGate.Lock(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property WhiterunGate  Auto  
