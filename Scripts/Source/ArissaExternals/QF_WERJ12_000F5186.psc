;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_WERJ12_000F5186 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bear
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bear Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BearCave
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BearCave Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BearSnow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BearSnow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Torvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_Farkas.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Athis.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Torvar.GetReference().MoveTo(alias_TravelMarker1.GetReference())

;enables Snow version in snowy part of Skyrim
If ((alias_myHoldLocation.getLocation()==HaafingerHold)||(alias_myHoldLocation.getLocation()==ThePaleHold)||(alias_myHoldLocation.getLocation()==WinterholdHold))
     alias_BearSnow.GetReference().Enable()
ElseIf  ((alias_myHoldLocation.getLocation()==RiftHold)||(alias_myHoldLocation.getLocation()==FalkreathHold))
     alias_Bear.GetReference().Enable()
Else
     alias_BearCave.GetReference().Enable()
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

alias_Farkas.GetReference().MoveToMyEditorLocation()
alias_Athis.GetReference().MoveToMyEditorLocation()
alias_Torvar.GetReference().MoveToMyEditorLocation()

; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Bear.GetReference().DeleteWhenAble()
Alias_BearCave.GetReference().DeleteWhenAble()
Alias_BearSnow.GetReference().DeleteWhenAble()
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
alias_Farkas.GetActorReference().EvaluatePackage()
alias_Athis.GetActorReference().EvaluatePackage()
alias_Torvar.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

location Property HaafingerHold  Auto  
Location Property HjaalmarchHold  Auto  
Location Property ReachHold  Auto  
Location Property WhiterunHold  Auto  
Location Property FalkreathHold  Auto  
Location Property ThePaleHold  Auto  
Location Property WinterholdHold  Auto  
Location Property EastmarchHold  Auto  
Location Property RiftHold  Auto   
