;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_MS13LucanCamillaScene_00038386 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Camilla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Camilla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lucan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lucan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Camilla walks to her chair
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player has entered the store with Lucan and Camilla
MS13LucanCamillaSceneView.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS13LucanCamillaSceneView  Auto  
