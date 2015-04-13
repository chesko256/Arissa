;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA02Post_0001A4EA Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewJarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NewJarl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_NewJarl.GetActorReference().ModFavorPoints(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
