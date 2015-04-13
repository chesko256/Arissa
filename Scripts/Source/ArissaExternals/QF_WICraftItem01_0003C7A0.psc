;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WICraftItem01_0003C7A0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Workbench
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Workbench Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICraftItem01Script
Quest __temp = self as Quest
WICraftItem01Script kmyQuest = __temp as WICraftItem01Script
;END AUTOCAST
;BEGIN CODE
;Not using this for these quick scenes of one line dialogue - will use repeat timer on quest in Story Manager to limit how often this happens
;kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript

;debug.messagebox("WICraftItem01 started")

; debug.trace("WICraftItem01 started")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
