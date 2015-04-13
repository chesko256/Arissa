;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 80
Scriptname QF_MQ104B_0002610C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Soldier3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hrongar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hrongar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Survivor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Survivor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerHousecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerHousecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MessengerStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MessengerStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dagny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FortTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Irileth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Irileth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Proventus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Proventus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelkir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelkir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWeapon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWeapon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SurvivorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SurvivorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FortCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frothar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frothar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Messenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Messenger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleCourtyardMarker6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastleCourtyardMarker6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE mq104script
Quest __temp = self as Quest
mq104script kmyQuest = __temp as mq104script
;END AUTOCAST
;BEGIN CODE
; turn on wrecked fort and dragon
FortAttackEnableMarker.Disable() ; switch state of fort to "destroyed" state
FortAttackNearbySpawnsMarker.disable() ; turn off nearby monster lists, random encounter triggers, etc.
												  ; also used for E3 demo to handle this stuff independently of MQ
FortAttackFXEnableMarker.Enable() ; turn on attack FX (fires etc.)
FortSoldiersEnableMarker.Disable(); turn off normal soldiers
Alias_Survivor.GetRef().Enable()
; enable soldiers
Alias_Soldier1.GetRef().Enable()
Alias_Soldier2.GetRef().Enable()
Alias_Soldier3.GetRef().Enable()
Alias_Soldier4.GetRef().Enable()
; for now - maybe delete these guys
;Alias_Soldier5.GetRef().Enable()
;Alias_Soldier6.GetRef().Enable()
; turn off other stuff:
; open 2 more dragon mounds
dunDragonMoundQST.SetStage(20)
; evp Delphine
Alias_Delphine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE mq104script
Quest __temp = self as Quest
mq104script kmyQuest = __temp as mq104script
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 200 start")
UnregisterForUpdate()
; clean up watchtower -- restore to original state?
;FortAttackEnableMarker.Disable() ; leave fort in destroyed state
FortAttackFXEnableMarker.Disable() ; turn OFF attack FX (fires etc.)
FortAttackNearbySpawnsMarker.enable() ; re-enable nearby encounters
FortSoldiersEnableMarker.Enable(); turn ON normal soldiers
; turn back on normal CW processing
; debug.trace("MQ104 Calling AddGarrisonBackToWar(" + kmyQuest.FortLocation + ")")
(CW as CWScript).AddGarrisonBackToWar(kmyQuest.FortLocation)
; debug.trace("MQ104 DONE Calling AddGarrisonBackToWar(" + kmyQuest.FortLocation + ")")
; clean up created guys
Alias_Messenger.GetReference().Disable()
Alias_Messenger.GetReference().Delete()

Alias_Survivor.GetRef().disable()
Alias_Survivor.GetRef().delete()

Alias_Soldier1.GetReference().Disable()
Alias_Soldier1.GetReference().Delete()

Alias_Soldier2.GetReference().Disable()
Alias_Soldier2.GetReference().Delete()

Alias_Soldier3.GetReference().Disable()
Alias_Soldier3.GetReference().Delete()

Alias_Soldier4.GetReference().Disable()
Alias_Soldier4.GetReference().Delete()

Alias_Soldier5.GetReference().Disable()
Alias_Soldier5.GetReference().Delete()

Alias_Soldier6.GetReference().Disable()
Alias_Soldier6.GetReference().Delete()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE mq104script
Quest __temp = self as Quest
mq104script kmyQuest = __temp as mq104script
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 90")
setstage(85) ; allow scene to advance in case that got missed
UnregisterForUpdate()
; player dragon death scene is finished
; use up a dragon soul
float souls = Game.GetPlayer().GetActorValue("DragonSouls") * -1.0
; debug.trace(self + " souls=" + souls)
Game.GetPlayer().ModActorValue("DragonSouls", souls)
; debug.trace(self + " player should now have 0 souls:  Game.GetPlayer().GetActorValue(DragonSouls)=" +  Game.GetPlayer().GetActorValue("DragonSouls") )
; failsafe - player should have it from Bleak Falls
Game.TeachWord(WordFus)
Game.UnlockWord(WordFus)

; turn on player shouting
AllowPlayerShout.value = 1
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
; set summons timer
kmyQuest.greybeardSummonsTimer = GameDaysPassed.GetValue() + 1
; start scene
OutroScene.Start()
; enable trigger
OutroTrigger.Enable()
utility.wait(1)
LearnShoutMsg.Show()
; disable Dragonsreach map marker
WhiterunDragonsReachMapMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; debug.trace(self + " stage 160")
; get rewarded by Balgruuf, complete MQ104
SetObjectiveCompleted(40)
; make player Thane of Whiterun
Alias_Balgruuf.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 3)
pFavorJarlsMakeFriends.GetOutofJailCard(Alias_Balgruuf.GetActorRef())
; give player weapon
Game.GetPlayer().AddItem(Alias_JarlWeapon.GetRef())
; housecarl
HousecarlEnableMarker.Enable()
WhiterunPlayerhousePackageHousecarl.Enable()
; move him to Dragonsreach
actor housecarl = Alias_PlayerHousecarl.GetActorRef()
housecarl.enable()
housecarl.Moveto(Alias_MessengerStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; Irileth finishes courtyard speech
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
; Irileth arrives at fort ahead of player
; just in case
IntroScene.Stop()
SifnarCourtyardScene.Stop()
FortAttackIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
; player goes to Greybeards before reporting back, end outro scene
OutroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; player has used his Shout
; debug.tracestack(self + " stage 100")
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; dragon is dead
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
; make sure other scenes are stopped
FortAttackIntroScene.Stop()
FortAttackScene.Stop()
DragonBattleScene.Stop()
; make sure all soldiers are alive:
(Alias_Soldier1 as defaultAliasRespawnScript).RespawnIfDead()
(Alias_Soldier2 as defaultAliasRespawnScript).RespawnIfDead()
(Alias_Soldier3 as defaultAliasRespawnScript).RespawnIfDead()
(Alias_Soldier4 as defaultAliasRespawnScript).RespawnIfDead()
;(Alias_Soldier5 as defaultAliasRespawnScript).RespawnIfDead()
;(Alias_Soldier6 as defaultAliasRespawnScript).RespawnIfDead()

; start death scene
DragonDeathScene.Start()

WI.updateWIDragonTimer()		;used to prevent dragons from appearing too frequently
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; player arrives at fort
Alias_Messenger.GetRef().Disable()
; move captain and soldiers to fort wait location
Alias_Soldier1.GetRef().MovetoIfUnloaded(FortMoveToMarker)
Alias_Soldier2.GetRef().MovetoIfUnloaded(FortMoveToMarker)
Alias_Soldier3.GetRef().MovetoIfUnloaded(FortMoveToMarker)
Alias_Soldier4.GetRef().MovetoIfUnloaded(FortMoveToMarker)
;Alias_Soldier5.GetRef().MovetoIfUnloaded(FortMoveToMarker)
;Alias_Soldier6.GetRef().MovetoIfUnloaded(FortMoveToMarker)
Alias_Irileth.GetRef().MovetoIfUnloaded(FortMoveToMarker)
; start fort attack intro scene
setstage(48)
; respawning for 2 soldiers
(Alias_Soldier1 as defaultAliasRespawnScript).bRespawningOn = true
(Alias_Soldier2 as defaultAliasRespawnScript).bRespawningOn = true
; turn off respawning for 4 soldiers
(Alias_Soldier3 as defaultAliasRespawnScript).bRespawningOn = false
(Alias_Soldier4 as defaultAliasRespawnScript).bRespawningOn = false
(Alias_Soldier5 as defaultAliasRespawnScript).bRespawningOn = false
(Alias_Soldier6 as defaultAliasRespawnScript).bRespawningOn = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; trigger player dragon absorb scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; finish MQ103
MQ103.setstage(200)
; player chooses to accompany Irileth
setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; dragon attacks
Alias_Dragon.GetActorRef().Enable()
Alias_Dragon.GetActorRef().SetForcedLandingMarker(DragonLandingMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
; if scene is over, clean up quest
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; wait for player to talk to Balgruuf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; debug.trace(self + " stage 150")
; transition to MQ105
MQ105.setstage(10)
; kill dragon scenes - failsafe
DragonDeathScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; enable Irileth and move into position
Alias_Irileth.TryToMoveTo(CaptainStartMarker)
Alias_Irileth.TryToEnable()
Alias_Messenger.TryToEnable()
IntroScene.Start()
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; Greybeard summons
utility.wait(2)
MQGreybeardCallKeyword.SendStoryEvent()

; start MQ105 to allow player to go directly to Greybeards
MQ105.setstage(5)

; reenable dragonsreach map marker
WhiterunDragonsReachMapMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; finished getting orders from Balgruuf
SetObjectiveCompleted(5)
SetObjectiveDisplayed(15)
SifnarCourtyardScene.Start()
FortMapMarker.Enable()
FortMapMarker.AddToMap()
; reward player
actor player = Game.GetPlayer()
Alias_Balgruuf.GetActorReference().SetRelationshipRank(player, 2)
if player.GetActorValue("LightArmor") > player.GetActorValue("HeavyArmor") 
	player.AddItem(FavorRewardEnchArmorLight)
else
	player.AddItem(FavorRewardEnchArmor)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
; dragon death scene over
; failsafe
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
; trigger shout tutorial
MQ104Shout.ShowAsHelpMessage("Shout", 5, 30, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; debug.trace(self + " stage 180")
; stop all scenes - failsafe for quickstart
OutroScene.Stop()
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
; soldier has mentioned Shouting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; dragon has entered combat
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
MQ104DragonFaction.SetEnemy(PlayerFaction)
;DragonBattleScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
; dragon crash landing
DragonCrashDisableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
; if player has been rewarded (stage 160), finish quest
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
; outro scene done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
; fort intro scene done - move QT into tower
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; debug.trace(self + " stage 120")
; player approaches Balgruuf, triggering outro scene
; IF CW03 needs her, move Irileth to inside Dragonsreach
if CW03.IsRunning() && Alias_Irileth.GetRef().Is3DLoaded() == false
	Alias_Irileth.TryToMoveTo(CaptainStartMarker)
endif
; failsafe
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; finish MQ103
MQ103.setstage(200)
; player chooses to meet Irileth at the fort
setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
; Irileth finished talking to Farengar
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; debug.trace("MQ Quickstart " + self)
MQ103.setstage(1)
MQ103.setstage(10)
MQ103.setstage(20)
MQ103.setstage(50)
MQ103.setstage(80)
MQ103.setstage(90)
MQ103.setstage(100)
MQ103.setstage(180)
; debug.trace("MQ Quickstart DONE" + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; player talks to soldier about being Dragonborn
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; Irileth starts courtyard speech
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; player/soldier triggers start of attack
FortAttackIntroScene.Stop()
FortAttackScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ103A  Auto  

Quest Property MQ103B  Auto  

Quest Property CW  Auto  

Scene Property IntroScene  Auto  

Scene Property SifnarCourtyardScene  Auto  

Scene Property FortAttackScene  Auto  

Faction Property MQ104DragonFaction  Auto  

Faction Property PlayerFaction  Auto  

Scene Property DragonDeathScene  Auto  

WordOfPower Property WordFus  Auto  

Message Property LearnShoutMsg  Auto  

Scene Property OutroScene  Auto  

GlobalVariable Property GameDaysPassed  Auto  

Quest Property MQ105  Auto  

Sound Property GreybeardSummonsSound  Auto  

ObjectReference Property FortMoveToMarker  Auto  
{marker to move soldiers to "catch up" when player gets to fort}

ObjectReference Property DragonLandingMarker  Auto  

Scene Property FortAttackIntroScene  Auto  
{intro scene for fort attack
ends when player or NPC enters fort
}

ObjectReference Property CaptainStartMarker  Auto  
{marker where Irileth starts
}

GlobalVariable Property AllowPlayerShout  Auto  
{set to 1 to turn on player shouting}


ObjectReference Property DragonCrashDisableMarker  Auto  
{disable this to get rid of gate during dragon crash
probably temp until we get animated object
}

Quest Property MQ103  Auto  

ObjectReference Property FortAttackEnableMarker  Auto  
{DISABLE this marker during the fort attack}

ObjectReference Property FortAttackFXEnableMarker  Auto  
{ENABLE this marker during the attack; DISABLE after complete}

ObjectReference Property FortSoldiersEnableMarker  Auto  
{DISABLE this marker to turn off normal guards
}

ObjectReference Property FortMapMarker  Auto  

Scene Property DragonBattleScene  Auto  

ObjectReference Property OutroTrigger  Auto  

LeveledItem Property FavorRewardEnchArmor  Auto  

FavorJarlsMakeFriendsScript Property pFavorJarlsMakeFriends  Auto  

Quest Property CW03  Auto  

objectReference Property FortAttackNearbySpawnsMarker  Auto  
{separate marker for nearby spawns and such so these can be controlled independently of fort state}

ObjectReference Property HousecarlEnableMarker  Auto  

Quest Property dunDragonMoundQST  Auto  

ObjectReference Property WhiterunPlayerHousePackageHousecarl  Auto  

LeveledItem Property FavorRewardEnchArmorLight  Auto  

Message Property MQ104Shout  Auto  

Keyword Property MQGreybeardCallKeyword  Auto  

WIFunctionsScript Property WI  Auto  

ObjectReference Property WhiterunDragonsReachMapMarker  Auto  
