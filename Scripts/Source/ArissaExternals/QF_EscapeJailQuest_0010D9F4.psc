;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_EscapeJailQuest_0010D9F4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DawnstarPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnstarPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EscapeLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EscapeLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EvidenceChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EvidenceChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EscapeHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EscapeHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalkreathPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalkreathPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MorthalPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MorthalPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EscapeCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EscapeCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenPrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiftenPrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudePrisonChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudePrisonChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
