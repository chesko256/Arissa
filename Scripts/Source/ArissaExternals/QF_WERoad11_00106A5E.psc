;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_WERoad11_00106A5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myAppropriateLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myAppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PaintedCow
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PaintedCow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farmer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farmer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerInCurrentHold
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MarkerInCurrentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantCampCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GiantCampCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;player has asked about the paint
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

alias_Farmer.GetReference().DeleteWhenAble()
alias_PaintedCow.GetReference().DeleteWhenAble()
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

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;player has talked to farmer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;farmer is dead
(Alias_PaintedCow.getReference() as Actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Cow reaches the center marker
(Alias_Farmer.getReference() as Actor).evaluatePackage()
(Alias_PaintedCow.getReference() as Actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; cow died
(Alias_Farmer.getReference() as Actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
