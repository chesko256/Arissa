;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CRSilverHandNameChangerQue_0009D6F6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit25
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit25 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit22
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit22 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit27
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit27 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit26
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit26 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit29
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit29 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit30
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit30 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit23
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit23 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit24
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit24 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Camp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Camp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit21
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit21 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit28
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit28 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit18 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR09NameChangerScript
Quest __temp = self as Quest
CR09NameChangerScript kmyQuest = __temp as CR09NameChangerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
