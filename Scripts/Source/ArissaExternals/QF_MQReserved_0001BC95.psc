;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_MQReserved_0001BC95 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KarthspireRedoubt
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_KarthspireRedoubt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EsbernsVault
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EsbernsVault Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ustengrav
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Ustengrav Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Korvanjund
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Korvanjund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sigrid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sigrid Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helgen
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Helgen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gerdur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gerdur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hod
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alvor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alvor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skuldafn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Skuldafn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; clear MQ102 reservations
Alias_Alvor.Clear()
Alias_Sigrid.Clear()
Alias_Hod.Clear()
Alias_Gerdur.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
