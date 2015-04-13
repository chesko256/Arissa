;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WIAssault01_0002C493 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Relative Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIAssault01Script
Quest __temp = self as Quest
WIAssault01Script kmyQuest = __temp as WIAssault01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
kmyquest.pForcegreetDay = kmyquest.pGameDaysPassed.value + 0.04167	;about an hour later
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
