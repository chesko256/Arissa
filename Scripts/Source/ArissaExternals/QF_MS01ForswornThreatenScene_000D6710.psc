;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MS01ForswornThreatenScene_000D6710 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DrystonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrystonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dryston
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dryston Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has been warned
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Move Dryston to marker
Alias_Dryston.GetActorRef().Enable()
Alias_Dryston.GetActorRef().Moveto(Alias_DrystonMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
