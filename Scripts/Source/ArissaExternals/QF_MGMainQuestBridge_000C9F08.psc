;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_MGMainQuestBridge_000C9F08 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirya Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;if Game.GetPLayer().GetFactionRank(CollegeFaction) == -2
;	GateTriggerRef.Enable()
;	Dorm1DoorRef.SetLockLevel(255)
;	Dorm1DoorRef.Lock(true, true)
;	Dorm2DoorRef.SetLockLevel(255)
;	Dorm2DoorRef.Lock(true, true)
;	ArchMageDoorRef.SetLockLevel(255)
;	ArchMageDoorRef.Lock(true, true)
;	ArcanaeumDoorRef.SetLockLevel(255)
;	ArcanaeumDoorRef.Lock(true, true)
;else
;	SetStage(200)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Dorm1DoorRef.Lock(False)
Dorm2DoorRef.Lock(False)
ArchMageDoorRef.Lock(False)
ArcanaeumDoorRef.Lock(False)
GateTriggerRef.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has talked his way into college; open gate and lock all other interior doors
GateRef.SetOpen()
; NOTE - I think this is what's supposed to happen here - KMK
ArcanaeumDoorRef.Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;player has successfully shouted
Alias_Nirya.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

objectreference Property GateRef  Auto  

objectreference Property GateTriggerRef  Auto  

ObjectReference Property Dorm1DoorRef  Auto  

ObjectReference Property ArcanaeumDoorRef  Auto  

ObjectReference Property Dorm2DoorRef  Auto  

ObjectReference Property ArchMageDoorRef  Auto  

Faction Property CollegeFaction  Auto  

int Property ScrollInfo  Auto  Conditional
