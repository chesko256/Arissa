;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ArenaCrowdQuest_000D7B12 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PitLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_PitLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spot06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spot06 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; fight over
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; move everyone inside
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; quest done
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
