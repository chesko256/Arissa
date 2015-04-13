;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DialogueSolitudeBardsColle_000D6A1D Extends Quest Hidden

;BEGIN ALIAS PROPERTY AtAfAlan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AtAfAlan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Inge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Inge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pantea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pantea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Illdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Illdi Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SolitudeBardsCollegeClassPanteaScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DialogueSolitudeBardsCollegeClassPanteaScene2.Setstage(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SolitudeBardsCollegeClassPanteaScene1  Auto  
Quest Property DialogueSolitudeBardsCollegeClassPanteaScene2 Auto
