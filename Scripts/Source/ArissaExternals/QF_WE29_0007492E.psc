;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WE29_0007492E Extends Quest Hidden

;BEGIN ALIAS PROPERTY CourierImperial
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CourierImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarkerRandomSonsCamp
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CenterMarkerRandomSonsCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierSons
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CourierSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarkerRandomImperialCamp
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CenterMarkerRandomImperialCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

Alias_CourierImperial.GetReference().DeleteWhenAble()
Alias_CourierSons.GetReference().DeleteWhenAble()
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
; debug.trace(self + "stage 0, disabling aliases, then rolling die to see which faction the courier will be")

Alias_CourierImperial.TryToDisable()
Alias_CourierSons.TryToDisable()

if Utility.RandomInt (1,2) == 1
; 	debug.trace(self + "stage 0, forcing CourierImperial into Courier alias")
	Alias_Courier.ForceRefTo(Alias_CourierImperial.GetReference())

else
; 	debug.trace(self + "stage 0, forcing CourierSons into Courier alias")
	Alias_Courier.ForceRefTo(Alias_CourierSons.GetReference())

endif

; debug.trace(self + "stage 0, enabling Courier alias")
Alias_Courier.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
