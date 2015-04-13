;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 75
Scriptname QF_MQ206_00036193 Extends Quest Hidden

;BEGIN ALIAS PROPERTY StatePast
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatePast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TimeWound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TimeWound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneAttackDragon2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneAttackDragon2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TimeWoundTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TimeWoundTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Felldir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Felldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AncientAlduinLandingMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AncientAlduinLandingMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BackgroundDragon1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BackgroundDragon1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinLandingMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlduinLandingMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gormlaith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gormlaith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AncientAlduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AncientAlduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hakon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hakon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlduinBattleLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AlduinBattleLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneAttackDragon1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneAttackDragon1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneAttackDragon3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneAttackDragon3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerTeleportMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerTeleportMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StatePresent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatePresent Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; dragon 1 lands
Alias_Dragon1.GetActorRef().SetAllowFlying(false)
; clear looking
Alias_Hakon.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
; Gormlaith killed (triggered by her alias script)
Alias_Felldir.GetActorRef().SetLookAt(Alias_AncientAlduin.GetRef(), true)
; try ghosting Felldir
Alias_Felldir.GetActorRef().SetGhost(true)
;Alias_Felldir.GetActorRef().SetNoBleedoutRecovery(false)
;Alias_Felldir.GetActorRef().RestoreActorValue("health", 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
; talked to Paarthurnax
; if player had Elder Scroll during MQ204, now we can stop it
MQ204.SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; Alduin defeated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; debug.trace(self + " stage 90 - Alduin cast into time wound")
; Alduin is cast forward in time
Actor alduin = Alias_AncientAlduin.GetActorRef()
ObjectReference timeWound = Alias_TimeWound.GetRef()
; try doing it manually
alduin.PlayIdle(AlduinDefeatIdle)
utility.wait(1.0) ; NEW
;alduin.placeAtMe(FXAlduinTimeWarpExplosion)
FXAlduinTimRiftEffect.Play(alduin, 7)
FXAlduinTimeFadeFXS.Play(alduin)
(alduin).PlaySubGraphAnimation("SkinFadeOut")
QSTMQ206AlduinTimeTravel2D.Play(Game.GetPlayer())
;utility.wait(1.0)	
utility.wait(2.0) ; NEW
utility.wait(3.0)
timeWound.Enable()
utility.wait(1.0)
alduin.Disable()
Alias_Felldir.GetActorRef().ClearLookAt()
;MQ206ManReadsScrollFXS.Stop(Alias_Felldir.GetRef())
FXTimeTravelImodStatic.ApplyCrossFade(10.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
; drop him out of combat, make unaggressive
Actor alduin = Alias_Alduin.GetActorRef()
alduin.SetActorValue("Aggression", 0)
alduin.SetActorValue("Assistance", 0)
; make Paarthurnax stop fighting
AncientAlduinFaction.SetEnemy(PaarthurnaxFaction, true, true)
alduin.StopCombatAlarm()
; kill Dragonrend if still running so Alduin can escape
MQAlduinIgnoreDragonrend.SetValue(1.0)
; allow him to get out of bleedout
Alias_Alduin.GetActorRef().SetNoBleedoutRecovery(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; start combat with player
Alias_Alduin.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Alduin.GetActorRef().SetActorValue("Aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
; testing - turn off Elder Scroll effect so I can see...
kmyQuest.CleanUpTimeTravelEffects()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has Elder Scroll
SetObjectiveDisplayed(10)
; watch for player to approach time-wound
TimeWoundTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; imod to Alduin on wall
FXTimeTravelImodStatic04.ApplyCrossFade(4.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; stop quest
; clear dragonrend variable
MQAlduinIgnoreDragonrend.SetValue(0)
Alias_Alduin.GetActorRef().Disable()
Alias_Alduin.GetActorRef().Delete()
; failsafe for quickstart
Alias_SceneAttackDragon1.GetRef().Disable()
Alias_SceneAttackDragon2.GetRef().Disable()
Alias_SceneAttackDragon3.GetRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
; move back to Felldir/Alduin
FXTimeTravelImodStatic03.ApplyCrossFade(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
Alias_Gormlaith.GetActorRef().ClearLookAt()
Alias_Hakon.GetActorRef().ClearLookAt()
Alias_Felldir.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
; kill move on Gormlaith
Alias_Gormlaith.GetActorRef().GetActorBase().SetEssential(false)
; make Gormlaith weak
Alias_Gormlaith.GetActorRef().SetActorValue("health", 1)
; put Felldir into bleedout
;Alias_Felldir.GetActorRef().SetNoBleedoutRecovery(true)
;Alias_Felldir.GetActorRef().kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Actor alduin = Alias_AncientAlduin.GetActorRef()
; get him to land 
alduin.SetAllowFlying(false)
;DragonrendAttackIMOD.Apply()
; teach words to player
game.teachWord(WordJoor)
game.teachWord(WordZah)
game.teachWord(WordFrul)
game.unlockWord(WordJoor)
game.unlockWord(WordZah)
game.unlockWord(WordFrul)
;alduin.EvaluatePackage()
; imod for Alduin on ground
FXTimeTravelImodStatic03.ApplyCrossFade(4.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
; imod for Hakon talking to Felldir
FXTimeTravelImodStatic03.ApplyCrossFade(6.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; enable Alduin
Alias_AncientAlduin.GetRef().Enable()
Alias_AncientAlduin.GetActorRef().SetForcedLandingMarker(Alias_AncientAlduinLandingMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
Alias_Hakon.GetActorRef().SetLookAt(Alias_Dragon1.GetActorRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; enable scene dragons
Alias_SceneAttackDragon1.GetRef().Enable()
Alias_SceneAttackDragon2.GetRef().Enable()
Alias_SceneAttackDragon3.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; make Alduin aggressive towards Paarthurnax
AncientAlduinFaction.SetEnemy(PaarthurnaxFaction)
Alias_Paarthurnax.GetActorRef().StartCombat(Alias_Alduin.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; quest completed
CompleteAllObjectives()
MQ301.SetStage(10)
MQ301.SetActive()
Alias_Paarthurnax.GetActorRef().ClearForcedLandingMarker()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; Paarthurnax hit by Alduin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
Actor gormlaith = Alias_Gormlaith.GetActorRef()
Actor dragon = Alias_Dragon1.GetActorRef()
; debug.trace(self + " trigger kill move Gormlaith vs. dragon")
gormlaith.PlayIdleWithTarget(GormlaithDragonKillMove, dragon)
;Alias_Dragon1.GetActorRef().Kill()
; hakon backs away while Gormlaith kills dragon
Alias_Hakon.GetActorRef().SetLookAt(Alias_Dragon1.GetActorRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; Hakon reaches marker, enable dragon 1
Alias_Dragon1.TryToEnable()
; debug.trace(self + " player's looking reenabled")
; everything's loaded, let player look around
Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, \
  abLooking = true, abSneaking = false, abMenu = false, abActivate = false, abJournalTabs = false)
; footstep effects on NPCs
FXFootstepsAttachSnowEffect.Play(Alias_Hakon.GetActorRef())
FXFootstepsAttachSnowEffect.Play(Alias_Gormlaith.GetActorRef())
FXFootstepsAttachSnowEffect.Play(Alias_Felldir.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
; Alduin struck by Dragonrend Shout
; no bleedout recovery
Alias_Alduin.GetActorRef().SetNoBleedoutRecovery(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
; send the player back to real Tamriel
kmyQuest.CleanUpTimeTravelEffects()
; undo ghostiness
Game.GetPlayer().SetGhost(0)
; reenable controls
Game.EnablePlayerControls()
Alias_StatePresent.GetRef().Enable()
Alias_Paarthurnax.GetRef().Enable()
Alias_StatePast.GetRef().Disable()
Game.ClearTempEffects()
Alias_Dragon1.TryToDisable()
Alias_Felldir.GetRef().Disable()
Alias_Hakon.GetRef().Disable()
Alias_Gormlaith.GetRef().Disable()
; disable scene dragons
Alias_SceneAttackDragon1.GetRef().Disable()
Alias_SceneAttackDragon2.GetRef().Disable()
Alias_SceneAttackDragon3.GetRef().Disable()
weather.ReleaseOverride()
; enable tracked objects
	; reenable everything
	DisableObjectTrigger.DisableObjects(false)
	; clear the form list
	DisableObjectTrigger.ClearList()
; move player back
Game.GetPlayer().moveTo(Alias_TimeWound.GetRef())
Game.SetInChargen(false, false, false)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
Actor alduin = Alias_Alduin.GetActorRef()
alduin.setActorValue("Aggression", 0)
alduin.Enable()
alduin.SetForcedLandingMarker(Alias_AlduinLandingMarker.GetRef())

Alias_Paarthurnax.GetActorRef().SetForcedLandingMarker(PaarthurnaxLandingMarker)
; make Alduin aggressive towards the player
; debug.trace(self + " make Alduin enemy of player")
AlduinFaction.SetEnemy(PlayerFaction)
PresentDayScene.Start()
; debug.trace(self + " stage 100 - request autosave")
Game.RequestAutoSave()
; debug.trace(self + " stage 100 - request autosave DONE")
;Disable the Dragon Mound Alduin Resurrection scenes; just enable the dragons there instead.
dunDragonMoundQST.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("MQ Quickstart " + self)
MQ205.SetStage(1)
MQ205.SetStage(100)
SetStage(10)
; give player elder scroll
Game.GetPlayer().Additem(kmyQuest.ElderScroll)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
;MQ206ManReadsScrollFXS.Play(Alias_Felldir.GetRef())
FXTimeTravelImodStatic01.ApplyCrossFade(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
; debug.trace(self + " stage 75 - heroes back away")
actor alduin = Alias_AncientAlduin.GetActorRef()
alduin.EvaluatePackage()
; make 3 heroes back away
Alias_Gormlaith.GetActorRef().SetLookAt(alduin, true)
Alias_Felldir.GetActorRef().SetLookAt(alduin, true)
Alias_Hakon.GetActorRef().SetLookAt(alduin, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
; debug.trace(self + "stage 87 - kill move on Hakon")
; Alduin kill move on Hakon - TODO
Alias_Hakon.GetActorRef().SetNoBleedoutRecovery(true)
Alias_Hakon.GetActorRef().kill()
; ghost alduin so he can't be knocked out of his animations
Alias_AncientAlduin.GetActorRef().setghost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
; dragon is dead
; clear looking
Alias_Hakon.GetActorRef().ClearLookAt()
FXTimeTravelImodStatic01.ApplyCrossFade(6.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace(self + " stage 20 START")
TimeWoundTrigger.Disable()
; tracked objects on top of mountain:
	; disable everything
	DisableObjectTrigger.DisableObjects()
	; turn off tracking
	DisableObjectTrigger.SetActive(false)
	; disable the trigger for performance
	DisableObjectTrigger.DisableNoWait()

; activate time-wound
; make player a ghost (can't take damage)
Game.GetPlayer().SetGhost(1)
; disable interface and fighting
; debug.trace(self + " player's controls disabled - no looking")
Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, \
  abLooking = true, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)
Game.ForceFirstPerson()
Game.SetInChargen(true, true, false)
Game.GetPlayer().moveTo(Alias_PlayerTeleportMarker.GetRef())
utility.wait(0.001) ; try to prevent load screen from triggering
Game.ClearTempEffects()
Alias_Paarthurnax.GetRef().DisableNoWait()
Alias_StatePresent.GetRef().DisableNoWait()
Alias_TimeWound.GetRef().DisableNoWait()
Alias_StatePast.GetRef().EnableNoWait()

Alias_Felldir.GetRef().EnableNoWait()
Alias_Gormlaith.GetRef().EnableNoWait()
Alias_Hakon.GetRef().Enable()
BattleScene.Start()
PastWeather.ForceActive()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
; allow player to look again
setstage(30)
; shut down MQ204 for sure
setstage(15)

; debug.trace(self + " stage 20 DONE")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ205  Auto  

Scene Property BattleScene  Auto  

Faction Property HeroFaction  Auto  

Faction Property AlduinFaction  Auto  

WordOfPower Property WordJoor  Auto  

WordOfPower Property WordZah  Auto  

WordOfPower Property WordFrul  Auto  

Faction Property AncientAlduinFaction  Auto  

Scene Property PresentDayScene  Auto  

Faction Property PlayerFaction  Auto  

Faction Property PaarthurnaxFaction  Auto  

Quest Property MQ301  Auto  

Weather Property PastWeather  Auto  


Faction Property PastFaction  Auto  

ObjectReference Property TimeWoundTrigger  Auto  
{trigger to tell when player is near time-wound}

; time travel effects:
VisualEffect Property FXAlduinTimRiftEffect Auto
;{USE AUTO FILL FOR THIS PROPERTY}
;Explosion Property FXAlduinTimeWarpExplosion Auto
{USE AUTO FILL FOR THIS PROPERTY}
EffectShader Property FXAlduinTimeFadeFXS Auto
{USE AUTO FILL FOR THIS PROPERTY}


Idle Property GormlaithDragonKillMove  Auto  

GlobalVariable Property MQAlduinIgnoreDragonrend  Auto  

Idle Property AlduinDefeatIdle  Auto  

MQ206ThroatoftheWorldTriggerScript Property DisableObjectTrigger  Auto  
{trigger that tracks objects to disable during "past" sequence}

Idle Property AlduinKillMove  Auto  

Quest Property dunDragonMoundQST  Auto  

EffectShader Property MQ206ManReadsScrollFXS  Auto  

ImageSpaceModifier Property FXTimeTravelImodStatic01 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic02 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic03 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic04 Auto

ImageSpaceModifier Property FXTimeTravelImodStatic  Auto  

Quest Property MQ204  Auto  

VisualEffect Property FXFootstepsAttachSnowEffect Auto


ObjectReference Property PaarthurnaxLandingMarker  Auto  

Sound Property QSTMQ206AlduinTimeTravel2D  Auto  

ImageSpaceModifier Property DragonrendAttackIMOD  Auto  
