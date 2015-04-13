;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIKill02_0002694B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Relative Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIKill02Script
Quest __temp = self as Quest
WIKill02Script kmyQuest = __temp as WIKill02Script
;END AUTOCAST
;BEGIN CODE
RegisterForUpdate(10)	;Unregistered in WIKill02Script after Victim starts haunting Victim.
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
kmyquest.pDeathDay = kmyquest.pGameDaysPassed.value
kmyquest.pHauntDay = kmyquest.pGameDaysPassed.value + 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
