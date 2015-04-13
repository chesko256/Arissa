;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CWSiegeObj_00096E71 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Objective3B
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective3B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective2B
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective2B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective1B
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective1B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityGate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityGate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective4B
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective4B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective1A
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective1A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective4A
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective4A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective3A
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective3A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Objective2A
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Objective2A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY General
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_General Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TextReplaceAttackDefend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TextReplaceAttackDefend Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWSiegeObjScript
Quest __temp = self as Quest
CWSiegeObjScript kmyQuest = __temp as CWSiegeObjScript
;END AUTOCAST
;BEGIN CODE
;SUCCESS
; debug.trace("CWSiegeObj Stage 9000")
CompleteAllObjectives()
kmyquest.CWs.displayFactionLeaderObjective()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWSiegeObjScript
Quest __temp = self as Quest
CWSiegeObjScript kmyQuest = __temp as CWSiegeObjScript
;END AUTOCAST
;BEGIN CODE
;FAILED
; debug.trace("CWSiegeObj Stage 8999")
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
