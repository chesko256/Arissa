;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_WERJ10_000C1A1F Extends Quest Hidden

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SabreCatSnow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SabreCatSnow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SabreCat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SabreCat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_Vilkas.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Ria.GetReference().MoveTo(alias_TravelMarker1.GetReference())

;enables Snow version in snowy part of Skyrim
If ((alias_myHoldLocation.getLocation()==HaafingerHold)||(alias_myHoldLocation.getLocation()==ThePaleHold)||(alias_myHoldLocation.getLocation()==WinterholdHold))
     alias_SabreCatSnow.GetReference().Enable()
Else
     alias_SabreCat.GetReference().Enable()
EndIf
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

alias_Vilkas.GetReference().MoveToMyEditorLocation()
alias_Ria.GetReference().MoveToMyEditorLocation()

Alias_SabreCat.GetReference().DeleteWhenAble()
Alias_SabreCatSnow.GetReference().DeleteWhenAble()
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

kmyQuest.setStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
alias_Vilkas.GetActorReference().EvaluatePackage()
alias_Ria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property HaafingerHold  Auto  
Location Property HjaalmarchHold  Auto  
Location Property ReachHold  Auto  
Location Property WhiterunHold  Auto  
Location Property FalkreathHold  Auto  
Location Property ThePaleHold  Auto  
Location Property WinterholdHold  Auto  
Location Property EastmarchHold  Auto  
Location Property RiftHold  Auto  
