;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIRemoveItem01_0002C6AB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WIRemoveItem01Script
Quest __temp = self as Quest
WIRemoveItem01Script kmyQuest = __temp as WIRemoveItem01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;condition on dialogue
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
