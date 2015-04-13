;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WIRemoveItem04_00034DAB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIRemoveItem04Script
Quest __temp = self as Quest
WIRemoveItem04Script kmyQuest = __temp as WIRemoveItem04Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
