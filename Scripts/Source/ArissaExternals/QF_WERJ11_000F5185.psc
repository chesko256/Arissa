;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_WERJ11_000F5185 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mammoth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mammoth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_Skjor.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Aela.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Njada.GetReference().MoveTo(alias_TravelMarker1.GetReference())
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

alias_Skjor.GetReference().MoveToMyEditorLocation()
alias_Aela.GetReference().MoveToMyEditorLocation()
alias_Njada.GetReference().MoveToMyEditorLocation()

; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Mammoth.GetReference().DeleteWhenAble()
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
alias_Skjor.GetActorReference().EvaluatePackage()
alias_Aela.GetActorReference().EvaluatePackage()
alias_Njada.GetActorReference().EvaluatePackage()
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
