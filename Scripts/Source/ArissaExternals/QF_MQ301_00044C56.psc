;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 52
Scriptname QF_MQ301_00044C56 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Soldier3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier2StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier2StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odahviing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Odahviing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier3StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier3StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier1StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier1StartMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Alias_Soldier1.GetRef().Delete()
Alias_Soldier2.GetRef().Delete()
Alias_Soldier3.GetRef().Delete()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; talked to Esbern
SetObjectiveCompleted(12)
SetStage(18)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE MQ301Script
Quest __temp = self as Quest
MQ301Script kmyQuest = __temp as MQ301Script
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 200 Start")
; Odahviing defeated/captured
; debug.trace(self + " stage 200 A")
kmyQuest.AdvanceDragonAttackScene(6)
; debug.trace(self + " stage 200 B")
Alias_Odahviing.GetActorRef().StopCombatAlarm()
Alias_Odahviing.GetActorRef().EvaluatePackage()
Alias_Odahviing.GetActorRef().SetRestrained(true)
Alias_Odahviing.GetActorRef().GetLeveledActorBase().SetInvulnerable(true)
TrapCollisionEnabler.Enable()
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
; get next scene ready
MQ303.SetStage(5)
; make sure
; debug.trace(self + " stage 200 C")
if MQCallDragon.IsRunning()
  MQCallDragon.SetStage(200)
endif
; remove Jarl ranged weapon
Alias_Jarl.GetActorRef().RemoveItem(JarlBow, 1)
Alias_Jarl.GetActorRef().RemoveItem(JarlArrow, 12)
Alias_Odahviing.GetActorRef().StopCombatAlarm()
; debug.trace(self + " stage 200 DONE")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Jarl promises to help if you arrange truce
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
MQ302.SetStage(10)
if IsActive()
	MQ302.SetActive()
endif
SetActive(false)
; Blades now go directly to kill Paarthurnax dialogue if not there already
MQPaarthurnax.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; Odahviing reveals location of Alduin's lair
CompleteAllObjectives()
; add achievement
Game.AddAchievement(7)
; failsafe
setstage(200)
DragonAttackScene.Stop()
MQ303.SetStage(10)
MQ303.SetActive()
; clear landing marker
Alias_Odahviing.GetActorRef().ClearForcedLandingMarker()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; MQ302 completed
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)

if MQ302.IsRunning()
	SetActive(true)
	MQ302.SetActive(false)
endif
; Blades now go directly to kill Paarthurnax dialogue if not there already
MQPaarthurnax.SetStage(15)
MQDisableClutter.Disable()
; make Elenwen unessential
Elenwen.SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; talked to Esbern or Paarthurnax or Arngeir
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace("MQ Quickstart " + self)
MQ206.SetStage(1)
MQ206.SetStage(50)
MQ206.SetStage(70)
MQ206.SetStage(220)
MQ206.SetStage(240)
; get rid of imods
ImageSpaceModifier.RemoveCrossFade(1)
; temp - to remove Esbern's blocking topic
MQ202.SetStage(200)
MQ203.SetStage(240)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; first asked Jarl about trapping dragon
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; player agrees to free Odahviing (exactly the same as MQ303 stage 20)
MQ303.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player learns Odahviing Shout
; update MQ302
MQ302.SetStage(310)
Game.TeachWord(WordOd)
Game.TeachWord(WordAh)
Game.TeachWord(WordViing)
; for now, just unlock it right away
Game.UnlockWord(WordOd)
Game.UnlockWord(WordAh)
Game.UnlockWord(WordViing)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
; failsafe/quickstart
MQDisableClutter.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE MQ301Script
Quest __temp = self as Quest
MQ301Script kmyQuest = __temp as MQ301Script
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
; make sure
kmyQuest.AdvanceDragonAttackScene(5)
; initiate trapping sequence
Alias_Odahviing.GetActorRef().SetAllowFlying(false)
Alias_Odahviing.GetActorRef().StopCombatAlarm()
; get him to revive if in bleedout
Alias_Soldier1.GetActorRef().StopCombat()
; enable corpse
if Alias_Soldier1.GetActorRef().GetActorBase() == ImperialSoldier
	MQ301OdahviingCasualty.enable()
else
	MQ301OdahviingCasualtySons.enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; Odahviing has been called
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
; clean up last quest
MQ302.SetStage(340)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; talked to Paarthurnax
SetObjectiveCompleted(10)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; set after speaking to Arngeir -- telling him about your battle with Alduin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; enable kill P dialogue
MQPaarthurnax.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if Alias_Paarthurnax.GetActorRef().IsDead() == 0
	SetObjectiveDisplayed(10)
endif
SetObjectiveDisplayed(11)
SetObjectiveDisplayed(12)
; Blades want you to kill Paarthurnax
MQPaarthurnax.SetStage(10)

; turn on update check for jarl alias
Alias_Jarl.RegisterForUpdate(5)
Alias_Housecarl.RegisterForUpdate(5)
Alias_Steward.RegisterForUpdate(5)
Alias_Follower.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE MQ301Script
Quest __temp = self as Quest
MQ301Script kmyQuest = __temp as MQ301Script
;END AUTOCAST
;BEGIN CODE
; player is ready to call Odahviing at Dragonsreach
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
; turn on quest update to watch for player not being in Dragonsreach
RegisterForUpdate(5)
; create soldiers for the dragon attack scene
if Alias_Jarl.GetActorRef().IsInFaction(GovImperial) == 1
	; create Whiterun soldiers
	Alias_Soldier1.ForceRefTo(Alias_Soldier1StartMarker.GetRef().PlaceAtMe(ImperialSoldier))
	Alias_Soldier2.ForceRefTo(Alias_Soldier2StartMarker.GetRef().PlaceAtMe(ImperialSoldier))
	Alias_Soldier3.ForceRefTo(Alias_Soldier3StartMarker.GetRef().PlaceAtMe(ImperialSoldier))
else
	; create stormcloaks
	Alias_Soldier1.ForceRefTo(Alias_Soldier1StartMarker.GetRef().PlaceAtMe(SonsSoldier))
	Alias_Soldier2.ForceRefTo(Alias_Soldier2StartMarker.GetRef().PlaceAtMe(SonsSoldier))
	Alias_Soldier3.ForceRefTo(Alias_Soldier3StartMarker.GetRef().PlaceAtMe(SonsSoldier))
endif
; make allies of player
PlayerFaction.SetAlly(SoldierFaction)
; start scene
kmyQuest.StartDragonAttackScene()
; set Odahviing landing marker
Alias_Odahviing.GetActorRef().SetForcedLandingMarker(WhiterunDragonsreachLandingMarker)
; give Jarl ranged weapon
Alias_Jarl.GetActorRef().AddItem(JarlBow)
Alias_Jarl.GetActorRef().AddItem(JarlArrow, 12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
; war was already over - skip peace council
SetObjectiveCompleted(20)
; go directly to trapping dragon
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; talked to Arngeir
SetObjectiveCompleted(11)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ206  Auto  

Quest Property MQ302  Auto  

WordOfPower Property WordOd  Auto  

WordOfPower Property WordAh  Auto  

WordOfPower Property WordViing  Auto  

Faction Property GovImperial  Auto  

ActorBase Property ImperialSoldier  Auto  

ActorBase Property SonsSoldier  Auto  

;ObjectReference Property DragonGate  Auto  
;{for now, just enable the gate.}

Scene Property DragonAttackScene  Auto  

Quest Property MQ303  Auto  

Quest Property MQ202  Auto  
{TEMP - to work around recursive setstage bug}

Quest Property MQ203  Auto  
{TEMP until setstage recursion works}

Quest Property MQPaarthurnax  Auto  

Faction Property PlayerFaction  Auto  

Faction Property SoldierFaction  Auto  

Faction Property OdahviingFaction  Auto  

Quest Property MQCallDragon  Auto  

ObjectReference Property WhiterunDragonsreachLandingMarker  Auto  

ObjectReference Property TrapCollisionEnabler  Auto  

ObjectReference Property MQDisableClutter  Auto  
{disable this marker to get rid of porch clutter}

ActorBase Property Elenwen  Auto  

WEAPON Property JarlBow  Auto  

Ammo Property JarlArrow  Auto  

ObjectReference Property MQ301OdahviingCasualty  Auto  

ObjectReference Property MQ301OdahviingCasualtySons  Auto  
