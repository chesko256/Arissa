;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIChangeLocation01_000350F4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Specator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Specator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Specator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Specator2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation01Script
Quest __temp = self as Quest
WIChangeLocation01Script kmyQuest = __temp as WIChangeLocation01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
