;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_EastmarchJailArenaFightQue_00092A54 Extends Quest Hidden

;BEGIN ALIAS PROPERTY JailkeeperStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JailkeeperStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerCellDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerCellDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorOutOfBloodworks
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoorOutOfBloodworks Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jailkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jailkeeper Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_DoorOutOfBloodworks.GetReference().SetLockLevel(0)
Alias_DoorOutOfBloodworks.GetReference().SetOpen(true)
Alias_DoorOutOfBloodworks.GetReference().Lock(false)
Alias_PlayerCellDoor.GetReference().BlockActivation(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_PlayerCellDoor.GetReference().BlockActivation(true)
Alias_PlayerCellDoor.GetReference().SetOpen()

(ArenaQuest as ArenaScript).StartCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Jailkeeper.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_JailKeeper.GetReference().MoveTo(Alias_JailkeeperStartMarker.GetReference())
Alias_DoorOutOfBloodworks.GetReference().SetLockLevel(255)
Alias_DoorOutOfBloodworks.GetReference().SetOpen(false)
Alias_DoorOutOfBloodworks.GetReference().Lock()

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ArenaQuest  Auto  
