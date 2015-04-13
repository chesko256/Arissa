;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WEJS04_000B5D5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierImperial2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoldierImperial2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierImperial1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoldierImperial1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Forsworn1.GetReference().DeleteWhenAble()
Alias_Forsworn2.GetReference().DeleteWhenAble()
Alias_Forsworn3.GetReference().DeleteWhenAble()
Alias_SoldierImperial1.GetReference().DeleteWhenAble()
Alias_SoldierImperial2.GetReference().DeleteWhenAble()

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
