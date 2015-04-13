;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_dunVolskyggeQST_00035384 Extends Quest Hidden

;BEGIN ALIAS PROPERTY chattyNPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeadTrackingTarget02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeadTrackingTarget02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeadTrackingTarget01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeadTrackingTarget01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyBanditGate1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyBanditGate1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyBanditGate2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyBanditGate2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
DoorScene.start()
BanditScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DoorScene  Auto  

Scene Property BanditScene  Auto  
