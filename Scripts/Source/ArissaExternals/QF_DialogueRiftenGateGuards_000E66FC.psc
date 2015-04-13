;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_DialogueRiftenGateGuards_000E66FC Extends Quest Hidden

;BEGIN ALIAS PROPERTY DRGGNorthGuardImperialAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGNorthGuardImperialAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRGGWestGuardAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGWestGuardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRGGNorthGuardAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGNorthGuardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRGGSouthGuardImperialAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGSouthGuardImperialAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRGGWestGuardImperialAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGWestGuardImperialAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRGGSouthGuardAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DRGGSouthGuardAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player walked away from North Gate or refused to bribe guard
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player was referred to North Gate by South or East Gate Guard
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug not needed, start game enabled
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player paid the bribe to enter the city
pUnlockScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;End Riften Startup & Unlock All Gates
pNorthGuard.Disable()
pSouthGuard.Disable()
pWestGuard.Disable()
pWestGate.Lock(false)
pNorthGate.Lock(false)
pSouthGate.Lock(false)
pJailDoor.Lock(false)
;pPlayerHouseDoor.Lock(false)
pMeaderyDoor.Lock(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pNorthGate  Auto  

ObjectReference Property pWestGate  Auto  

ObjectReference Property pPlayerHouseDoor  Auto  

ObjectReference Property pMeaderyDoor  Auto  

ObjectReference Property pJailDoor  Auto  

ObjectReference Property pSouthGate  Auto  

ObjectReference Property pWestGuard  Auto  

ObjectReference Property pNorthGuard  Auto  

ObjectReference Property pSouthGuard  Auto  

Scene Property pUnlockScene  Auto  

MiscObject Property pGold  Auto
