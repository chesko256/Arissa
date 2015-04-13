;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WIAddItem01_0002C437 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WIAdditem01Script
Quest __temp = self as Quest
WIAdditem01Script kmyQuest = __temp as WIAdditem01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
