;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WIAddItem02_00034DA3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIAdditem02Script
Quest __temp = self as Quest
WIAdditem02Script kmyQuest = __temp as WIAdditem02Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
