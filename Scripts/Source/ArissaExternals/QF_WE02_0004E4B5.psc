;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WE02_0004E4B5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hunter1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Hunter1.GetReference().DeleteWhenAble()
Alias_Hunter2.GetReference().DeleteWhenAble()
Alias_Deer.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
