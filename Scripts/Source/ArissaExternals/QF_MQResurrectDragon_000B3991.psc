;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_MQResurrectDragon_000B3991 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AlduinPosition02d
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition02d Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition03d
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition03d Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition01d
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition01d Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPositionC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPositionC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMound02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMound02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonEmergePosition02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonEmergePosition02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tracker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tracker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonEmergePosition03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonEmergePosition03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMound03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMound03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPositionB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPositionB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tracker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tracker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra02DisableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra02DisableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition01c
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition01c Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition03c
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition03c Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonEmergePosition
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonEmergePosition Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition03b
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition03b Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMound01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMound01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition01b
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition01b Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tracker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tracker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonEmergePosition01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonEmergePosition01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra01DisableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra01DisableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPositionD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPositionD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition02b
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition02b Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition02c
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition02c Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinPosition03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinPosition03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Scene 2 running.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Scene 1 running.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Scene 1 was skipped. Pull the dragon out of the mound.
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).AbortResurrection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Scene 2 was skipped. Pull the dragon out of the mound.
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).AbortResurrection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;MQ206 100, so close out the last scene, disable Alduin, stop the quest.
Alias_Tracker03.GetRef().Disable()
(Alias_Alduin as MQResurrectDragonTracking).Cleanup()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Scene 2 completed successfully.
Alias_Alduin.GetActorRef().SetAV("Variable06", 1)
Alias_Alduin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Scene 1 completed successfully.
Alias_Alduin.GetActorRef().SetAV("Variable06", 1)
Alias_Alduin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Scene 3 completed successfully.
Alias_Alduin.GetActorRef().SetAV("Variable06", 1)
Alias_Alduin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Stop Scene 1, if it was running, and clear out its data.
(Alias_Alduin as MQResurrectDragonTracking).Cleanup()

;Force references for Scene 2
Alias_Dragon02.GetRef().Enable()
Alias_Dragon.ForceRefTo(Alias_Dragon02.GetRef())
Alias_DragonMound.ForceRefTo(Alias_DragonMound02.GetRef())
Alias_AlduinPosition.ForceRefTo(Alias_AlduinPosition02.GetRef())
Alias_AlduinPositionB.ForceRefTo(Alias_AlduinPosition02b.GetRef())
Alias_AlduinPositionC.ForceRefTo(Alias_AlduinPosition02c.GetRef())
Alias_AlduinPositionD.ForceRefTo(Alias_AlduinPosition02d.GetRef())
Alias_DragonEmergePosition.ForceRefTo(Alias_DragonEmergePosition02.GetRef())
Alias_DragonMoundTundra02DisableMarker.GetRef().Disable()

;Change mound state
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).ChangeState(1)

;Set up load trackers.
Alias_Tracker01.GetRef().Disable()
Alias_Tracker02.GetRef().Enable()

;Move Alduin into position over DragonMoundTundra03.
Alias_Alduin.GetActorRef().Enable()
Alias_Alduin.GetActorRef().EvaluatePackage()
Alias_Alduin.GetActorRef().MoveTo(Alias_AlduinPosition.GetReference())

;Start Rez Scene 2 (waits for player)
SetStage(21)
MQResurrectDragonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Scene 3 running.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Scene 3 was skipped. Pull the dragon out of the mound.
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).AbortResurrection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Stop Scene 2, if it was running, and clear out its data.
; Debug.Trace("Stage 30 Cleanup Old Scenes")
(Alias_Alduin as MQResurrectDragonTracking).Cleanup()

;Force references for Scene 3
Alias_Dragon03.GetRef().Enable()
Alias_Dragon.ForceRefTo(Alias_Dragon03.GetRef())
Alias_DragonMound.ForceRefTo(Alias_DragonMound03.GetRef())
Alias_AlduinPosition.ForceRefTo(Alias_AlduinPosition03.GetRef())
Alias_AlduinPositionB.ForceRefTo(Alias_AlduinPosition03b.GetRef())
Alias_AlduinPositionC.ForceRefTo(Alias_AlduinPosition03c.GetRef())
Alias_AlduinPositionD.ForceRefTo(Alias_AlduinPosition03d.GetRef())
Alias_DragonEmergePosition.ForceRefTo(Alias_DragonEmergePosition03.GetRef())

;Change mound state
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).ChangeState(1)

;Set up load trackers.
Alias_Tracker02.GetRef().Disable()
Alias_Tracker03.GetRef().Enable()

;Move Alduin into position over DragonMoundSnowy02.
Alias_Alduin.GetActorRef().Enable()
Alias_Alduin.GetActorRef().EvaluatePackage()
Alias_Alduin.GetActorRef().MoveTo(Alias_AlduinPosition.GetReference())

; Debug.Trace("Stage 30 Starting Scene")
;Start Rez Scene 3 (waits for player)
SetStage(31)
MQResurrectDragonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; debug.trace(self + " STAGE 0 - Quest started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Force references for Scene 1
Alias_Dragon01.GetRef().Enable()
Alias_Dragon.ForceRefTo(Alias_Dragon01.GetRef())
Alias_DragonMound.ForceRefTo(Alias_DragonMound01.GetRef())
Alias_AlduinPosition.ForceRefTo(Alias_AlduinPosition01.GetRef())
Alias_AlduinPositionB.ForceRefTo(Alias_AlduinPosition01b.GetRef())
Alias_AlduinPositionC.ForceRefTo(Alias_AlduinPosition01c.GetRef())
Alias_AlduinPositionD.ForceRefTo(Alias_AlduinPosition01d.GetRef())
Alias_DragonEmergePosition.ForceRefTo(Alias_DragonEmergePosition01.GetRef())
Alias_DragonMoundTundra01DisableMarker.GetRef().Disable()

;Change mound state
(Alias_DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).ChangeState(1)

;Set up load trackers.
Alias_Tracker01.GetRef().Enable()

;Move Alduin into position over DragonMoundTundra01.
; Debug.Trace("ENABLING ALDUIN")
Alias_Alduin.GetActorRef().Enable()
Alias_Alduin.GetActorRef().EvaluatePackage()
Alias_Alduin.GetActorRef().MoveTo(Alias_AlduinPosition.GetReference())

;Start Rez Scene 1 (waits for player)
SetStage(11)
MQResurrectDragonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQResurrectDragonScene  Auto  

Keyword Property LinkCustom01  Auto  
