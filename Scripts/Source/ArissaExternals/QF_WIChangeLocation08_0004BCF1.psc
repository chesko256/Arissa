;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIChangeLocation08_0004BCF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Child1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Child2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyHideMarker4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyHideMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyHideMarker3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyHideMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyHideMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyHideMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyHideMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyHideMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VerifyHideMarker5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VerifyHideMarker5 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation08Script
Quest __temp = self as Quest
WIChangeLocation08Script kmyQuest = __temp as WIChangeLocation08Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
; debug.trace("WIChangeLocation08 stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
