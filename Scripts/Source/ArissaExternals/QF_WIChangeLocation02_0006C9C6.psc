;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_WIChangeLocation02_0006C9C6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dwelling
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dwelling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Spectator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Merchant
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Merchant Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation02Script
Quest __temp = self as Quest
WIChangeLocation02Script kmyQuest = __temp as WIChangeLocation02Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript

; debug.trace("WIChangeLocation02 Spectator:" + Alias_Spectator.GetReference())
; debug.trace("WIChangeLocation02 Boss:" + Alias_Boss.GetReference())
; debug.trace("WIChangeLocation02 Innkeeper:" + Alias_Innkeeper.GetReference())
; debug.trace("WIChangeLocation02 Merchant:" + Alias_Merchant.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
