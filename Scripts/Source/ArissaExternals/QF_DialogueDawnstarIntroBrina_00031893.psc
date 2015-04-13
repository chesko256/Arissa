;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_DialogueDawnstarIntroBrina_00031893 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Skald
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skald Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horik
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horik Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brina
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brina Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start scene
DawnstarIntroBrinaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DawnstarIntroBrinaScene  Auto  
