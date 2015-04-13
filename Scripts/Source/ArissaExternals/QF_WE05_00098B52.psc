;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WE05_00098B52 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orc2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orc2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orc3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orc3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forsworn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orc1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orc1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forsworn4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forsworn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forsworn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
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
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
