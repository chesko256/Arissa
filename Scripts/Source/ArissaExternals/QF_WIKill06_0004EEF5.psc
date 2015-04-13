;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WIKill06_0004EEF5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Thug2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Letter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug3
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter3
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Letter3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Letter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has encountered the thugs, so they shouldn't move around any more (this is condition in Story Manager for WEWIKill06 quest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIKill06Script
Quest __temp = self as Quest
WIKill06Script kmyQuest = __temp as WIKill06Script
;END AUTOCAST
;BEGIN CODE
;NOTE: See also WEWIKill06 quest which uses the WETriggers to move and enable the thugs

; debug.trace("WIKill06 Stage 0, disabling Thug aliases")
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
Alias_Thug1.TryToDisable()
Alias_Thug2.TryToDisable()
Alias_Thug3.TryToDisable()

; debug.trace("WIKill06 Stage 0, moving Letters to Thugs")
Alias_Thug1.GetReference().AddItem(Alias_Letter1.GetReference())
Alias_Thug2.GetReference().AddItem(Alias_Letter2.GetReference())
Alias_Thug3.GetReference().AddItem(Alias_Letter3.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WIKill06Script
Quest __temp = self as Quest
WIKill06Script kmyQuest = __temp as WIKill06Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIKill06 Stage 255 shut down stage, deleting Thug aliases")

Alias_Thug1.GetReference().DeleteWhenAble()
Alias_Thug2.GetReference().DeleteWhenAble()
Alias_Thug3.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
