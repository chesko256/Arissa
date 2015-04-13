;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DialogueRiverwood_Revised_00045486 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GeneralStoreOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GeneralStoreOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alvor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alvor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GeneralStoreOwnerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GeneralStoreOwnerBackup Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Frodnar said his into hello
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE RiverwoodScript
Quest __temp = self as Quest
RiverwoodScript kmyQuest = __temp as RiverwoodScript
;END AUTOCAST
;BEGIN CODE
; First scene with Delphine and Orgnar has started, or shouldn't play

kmyQuest.SceneTriggerBox.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Scene ends
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
