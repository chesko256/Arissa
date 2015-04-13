;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WICraftItem02_0009BB1E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Enchanter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enchanter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Workbench
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Workbench Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICraftItem02
Quest __temp = self as Quest
WICraftItem02 kmyQuest = __temp as WICraftItem02
;END AUTOCAST
;BEGIN CODE
;Not using this for these quick scenes of one line dialogue - will use repeat timer on quest in Story Manager to limit how often this happens
;kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript

;debug.messagebox("WICraftItem02 started")

; debug.trace("WICraftItem02 started")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
