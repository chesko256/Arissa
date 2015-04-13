;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_WIChangeLocation09_00050AF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DistantOutsideEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DistantOutsideEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; debug.trace("WIChangeLocation09 stage 255, shut down stage")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE WIChangeLocation09Script
Quest __temp = self as Quest
WIChangeLocation09Script kmyQuest = __temp as WIChangeLocation09Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIChangeLocation09 stage 1, start scene")
kmyquest.WIChangeLocation09Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation09Script
Quest __temp = self as Quest
WIChangeLocation09Script kmyQuest = __temp as WIChangeLocation09Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIChangeLocation09 stage 0")
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript

Actor DragonActor = Alias_Dragon.GetActorReference()

; debug.trace("WIChangeLocation09 stage 0, calling RegisterDragonAttack() and updateWIDragonTimer()")
kmyquest.WIs.RegisterDragonAttack(Alias_NewLocation.GetLocation(), Alias_Dragon.GetActorReference())
kmyquest.WIs.updateWIDragonTimer()

; debug.trace("WIChangeLocation09 stage 0, registering Guard Aliases for LOS gain on dragon")

Alias_Guard1.RegisterForSingleLOSGain(Alias_Guard1.GetActorReference(), DragonActor)
Alias_Guard2.RegisterForSingleLOSGain(Alias_Guard2.GetActorReference(), DragonActor)
Alias_Guard3.RegisterForSingleLOSGain(Alias_Guard3.GetActorReference(), DragonActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
