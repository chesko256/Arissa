;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_MQ00_0001C5D9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElderScroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ElderScroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EsbernDreamLookTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EsbernDreamLookTarget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; called by MQ102 during chargen - place to put "startup" quests that can't start enabled for various reasons
HousePurchase.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start esbern dream scene
MQEsbernDreamScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; progress esbern dream scene when player approaches
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQEsbernDreamScene  Auto  

Quest Property HousePurchase  Auto  
