;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 47
Scriptname QF_MQ303_00046EF0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DragonWatcher1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonWatcher1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonWatcher2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonWatcher2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odahviing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Odahviing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PortalActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PortalActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skuldafn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Skuldafn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GateGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GateGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiamondClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiamondClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkuldafnOdahviing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkuldafnOdahviing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gatekeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gatekeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PortalStaff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PortalStaff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StaffMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StaffMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraugrWithClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DraugrWithClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossDragonPriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossDragonPriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PORTAL
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PORTAL Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; trigger Odahviing transport scene
; debug.trace(self + "stage 50")
Game.DisablePlayerControls()
Alias_Odahviing.GetActorRef().DispelAllSpells()
Alias_Odahviing.GetActorRef().SetAllowFlying(true)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE MQ303Script
Quest __temp = self as Quest
MQ303Script kmyQuest = __temp as MQ303Script
;END AUTOCAST
;BEGIN CODE
; arrive at Skuldafn
; debug.trace("MQ303 100")
Game.EnablePlayerControls()
Game.ForceThirdPerson()
; ok to stop MQ301 now
MQ301.SetStage(240)
; damage dragon priest boss based on player's level
kmyQuest.DamageBoss(Alias_BossDragonPriest.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; dragon priest has deactivated portal (picked up staff)
(PortalToSovngarde as FXSkuldafnPortal).OpenPortal(Alias_BossDragonPriest.GetRef(), false)
Alias_PortalStaff.GetRef().Enable()
Alias_BossDragonPriest.GetRef().AddItem(Alias_PortalStaff.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; player has picked up staff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
; clean up combat
Alias_Housecarl.GetActorRef().StopCombatAlarm()
Alias_Jarl.GetActorRef().StopCombatAlarm()
FarengarOdahviingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; debug.trace("MQ Quickstart " + self)
MQ301.SetStage(70)
MQ301.SetStage(120)
MQ301.SetStage(150)
MQ301.SetStage(180)
;MQ301.SetStage(200)
MQ301.SetStage(220)
MQ301.SetStage(1)
Alias_Odahviing.GetRef().Moveto(OdahviingStartMarker)
Alias_Odahviing.GetRef().Enable()
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player asks guard to open gate
OpenGateScene.Start()
; clean up combat
Alias_Housecarl.GetActorRef().StopCombatAlarm()
Alias_Jarl.GetActorRef().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; Odahviing stops fighting and leaves
Alias_Odahviing.GetActorRef().EvaluatePackage()
; debug.trace("MQ303 120")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; trigger move to Skuldafn
OdahviingFaction.SetEnemy(DraugrFaction)
Game.GetPlayer().MoveTo(SkuldafnStartMarker)
;Alias_Odahviing.GetRef().Moveto(SkuldafnOdahviingStartMarker)
; dismount
Game.GetPlayer().PlayIdle(grounddismountdragonNPC)
Alias_SkuldafnOdahviing.GetActorRef().PlayIdle(grounddismountdragon)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; reached top of Skuldafn
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
; trigger portal deactivation scene
MQ303PortalScene.Start()
; start MQ304 to get ready
MQ304.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; player enters Sovngarde
; debug.trace(self + " stage 300 START")
CompleteAllObjectives()
; ;debug.trace(self + " stage 300 A")
MQ304.SetStage(10)
MQ304.SetActive()
; ;debug.trace(self + " stage 300 B")
Alias_SkuldafnOdahviing.TryToDisable()
Stop()
; ;debug.trace(self + " stage 300 END")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; player enters final exterior section of Skuldafn
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; start quest so intro scene can start
; get gatekeeper from MQ301
Alias_Gatekeeper.ForceRefTo(MQ301Gatekeeper.GetRef())
Alias_GateGuard2.ForceRefTo(MQ301Soldier2.GetRef())
IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; Odahviing in position, ready to fly
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; Farengar/Odahviing scene finished
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; trigger paired anim of player riding Odahviing
; debug.trace(self + "stage 55 - trigger paired animation")
Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, \
  abLooking = false, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = false)
Game.ForceThirdPerson()
Alias_Odahviing.GetActorRef().PlayIdleWithTarget(groundMountDragonIdle, Game.GetPlayer())
MUSOdahviingRiding.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Gate is open
TrapCollisionEnabler.Disable()
; unrestrain Odahviing, no longer invulnerable
Alias_Odahviing.GetActorRef().SetRestrained(false)
Alias_Odahviing.GetActorRef().SetAllowFlying(false)
Alias_Odahviing.GetActorRef().GetLeveledActorBase().SetInvulnerable(false)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
OdahviingScene.Start()
OpenGateScene.Stop()
IntroScene.Stop()
; clean up combat
Alias_Housecarl.GetActorRef().StopCombatAlarm()
Alias_Jarl.GetActorRef().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; reactivate portal
(PortalToSovngarde as FXSkuldafnPortal).OpenPortal(Game.GetPlayer(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; player agrees to free Odahviing
; make sure
Alias_Odahviing.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;ObjectReference Property DragonGate  Auto  

ReferenceAlias Property MQ301Gatekeeper  Auto  
{Soldier who mans the dragon gate}

ObjectReference Property SkuldafnStartMarker  Auto  

Quest Property MQ301  Auto  

Scene Property OdahviingScene  Auto  

Scene Property OpenGateScene  Auto  

ObjectReference Property OdahviingStartMarker  Auto  
{temp for quickstarting quest}

ObjectReference Property PortalToSovngarde  Auto  

Quest Property MQ304  Auto  

Faction Property OdahviingFaction  Auto  

Faction Property DraugrFaction  Auto  

ObjectReference Property SkuldafnOdahviingStartMarker  Auto  

Scene Property IntroScene  Auto  

Scene Property FarengarOdahviingScene  Auto  

ReferenceAlias Property MQ301Soldier2  Auto  

Scene Property MQ303PortalScene  Auto  

ObjectReference Property TrapCollisionEnabler  Auto  

Idle Property groundMountDragonIdle  Auto  

Idle Property grounddismountdragon  Auto  

Idle Property grounddismountdragonNPC  Auto  

MusicType Property MUSOdahviingRiding  Auto  
