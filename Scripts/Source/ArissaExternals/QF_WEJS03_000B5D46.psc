;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WEJS03_000B5D46 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Merchant
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Merchant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Horse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn2 Auto
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
Alias_Merchant.GetReference().DeleteWhenAble()
Alias_Horse.GetReference().DeleteWhenAble()
Alias_Forsworn1.GetReference().DeleteWhenAble()
Alias_Forsworn2.GetReference().DeleteWhenAble()
Alias_Forsworn3.GetReference().DeleteWhenAble()

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
Actor Horse = Alias_Horse.getReference() as Actor
Actor Merchant = Alias_Merchant.getReference() as Actor

horse.setActorOwner(Merchant.getActorBase())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
