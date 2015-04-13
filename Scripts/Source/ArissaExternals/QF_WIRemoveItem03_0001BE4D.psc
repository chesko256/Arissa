;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WIRemoveItem03_0001BE4D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIRemoveItem03Script
Quest __temp = self as Quest
WIRemoveItem03Script kmyQuest = __temp as WIRemoveItem03Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIRemoveItem03 Stage 0 (startup)")
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace("WIRemoveItem03 Stage 255 (shutdown)")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
