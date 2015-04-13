;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WICourier_00039F82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Container
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Container Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierMarker
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CourierMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace("WICourier: stage 0, start up")
;move to location center marker and enable
Alias_Courier.getReference().moveto(Alias_LocationCenterMarker.getReference())
Alias_Courier.getReference().enable()
registerForUpdate(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace("WICourier: stage 200, shut down")
;move to holding cell and disable
Alias_Courier.getReference().moveto(Alias_CourierMarker.getReference())
Alias_Courier.getReference().disable()
unRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
