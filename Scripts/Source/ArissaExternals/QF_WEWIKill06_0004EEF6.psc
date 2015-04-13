;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_WEWIKill06_0004EEF6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Thug2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug3
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Thug1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0, moving and enabling Thugs")

Alias_Thug1.TryToMoveTo(Alias_TravelMarker1.GetReference())
Alias_Thug2.TryToMoveTo(Alias_TravelMarker1.GetReference())
Alias_Thug3.TryToMoveTo(Alias_TravelMarker1.GetReference())
Alias_Thug1.TryToEnable()
Alias_Thug2.TryToEnable()
Alias_Thug3.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
