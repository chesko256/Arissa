;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname QF_DA03Start_000D7939 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Lod
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA03Meat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA03Meat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialGateGuard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialGateGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsGateGuard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SonsGateGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialGateGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialGateGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsGateGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SonsGateGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA03StartBarbasMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA03StartBarbasMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
DA03.Setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
Game.GetPlayer().Additem(Gold001,25)
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA03  Auto  

MiscObject Property Gold001  Auto  
