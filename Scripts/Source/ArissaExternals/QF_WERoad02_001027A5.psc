;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WERoad02_001027A5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Horse01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noble01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Noble01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bodyguard01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bodyguard01 Auto
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
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker1 Auto
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
; ;debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Noble01.GetReference().DeleteWhenAble()
Alias_Horse01.GetReference().DeleteWhenAble()
Alias_Bodyguard01.GetReference().DeleteWhenAble()
;Alias_Bodyguard02.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE QF_WERoad02_001027A5
Quest __temp = self as Quest
QF_WERoad02_001027A5 kmyQuest = __temp as QF_WERoad02_001027A5
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0")

Actor Horse01 = Alias_Horse01.getReference() as Actor
Actor Noble01 = Alias_Noble01.getReference() as Actor
;Actor Horse02 = Alias_Horse02.getReference() as Actor
;Actor Noble02 = Alias_Noble02.getReference() as Actor

horse01.setFactionOwner(WERoad02NobleFaction)
;horse02.setFactionOwner(WERoad02NobleFaction)

;Noble02.setvehicle(Horse02)
;Noble01.setvehicle(Horse01)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property WERoad02NobleFaction Auto
