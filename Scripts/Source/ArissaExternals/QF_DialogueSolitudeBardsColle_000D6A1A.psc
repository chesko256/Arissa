;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DialogueSolitudeBardsColle_000D6A1A Extends Quest Hidden

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

;BEGIN ALIAS PROPERTY Giraud
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Giraud Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Illdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Illdi Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DialogueSolitudeBardsCollegeClassGiraudScene2.Setstage(0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SolitudeBardsCollegeClassGiraudScene1.Start()

;If (Utility.GetCurrentGameTime()) > 14 && (Utility.GetCurrentGameTime()) < 18
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SolitudeBardsCollegeClassGiraudScene1  Auto  

Quest Property DialogueSolitudeBardsCollegeClassGiraudScene2 Auto
