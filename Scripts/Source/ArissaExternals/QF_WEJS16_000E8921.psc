;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_WEJS16_000E8921 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hunter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spriggan
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Spriggan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AnimalCorpse
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AnimalCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Spriggan.GetReference().DeleteWhenAble()
Alias_Hunter.GetReference().DeleteWhenAble()
Alias_AnimalCorpse.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

