;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_dunHalldirsCairnQST_0003AD4A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Halldir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CairnEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CairnEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapdoorStatic
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapdoorStatic Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirStorm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirStorm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirDeathActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirDeathActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirFire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirFire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirSoulStandin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirSoulStandin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirFrost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirFrost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SFXBeamFade
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SFXBeamFade Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SFXBeamLow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SFXBeamLow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalldirsBeam
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalldirsBeam Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrapdoorActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrapdoorActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SFXBeamMain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SFXBeamMain Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;All of Halldir's forms have been killed, so he respawns.
(Alias_Halldir as dunHalldirBossBattle2).StartFinalBattle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Alias_Halldir as dunHalldirBossBattle2).ReadyHalldir()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Release the sealed door, open the portcullis, and shatter the cairn.
Game.GetPlayer().RampRumble(0.75, 2, 1600)
Alias_CairnEnableMarker.GetReference().Disable()
Alias_HalldirDeathActivator.GetReference().Activate(Game.GetPlayer())
Alias_TrapdoorActivator.GetReference().Enable()
Alias_HalldirsBeam.GetReference().DisableNoWait(True)

;Deal with the Beam SFX
Alias_SFXBeamMain.GetReference().Disable()
Alias_SFXBeamLow.GetReference().Disable()
Alias_SFXBeamFade.GetReference().Enable()

Utility.Wait(0.1)
Alias_TrapdoorStatic.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SealedDoorObj  Auto  
