;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WE22_0005E93E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SoldierImperial3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierImperial3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierSons1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierSons1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierSons2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierSons2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierImperial2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierImperial2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierImperial1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierImperial1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoldierSons3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoldierSons3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

alias_SoldierImperial1.GetReference().DeleteWhenAble()
alias_SoldierImperial2.GetReference().DeleteWhenAble()
alias_SoldierImperial3.GetReference().DeleteWhenAble()
alias_SoldierSons1.GetReference().DeleteWhenAble()
alias_SoldierSons2.GetReference().DeleteWhenAble()
alias_SoldierSons3.GetReference().DeleteWhenAble()
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
