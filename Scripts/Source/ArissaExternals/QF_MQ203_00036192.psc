;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 56
Scriptname QF_MQ203_00036192 Extends Quest Hidden

;BEGIN ALIAS PROPERTY secretDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_secretDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RemansWallTarget5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RemansWallTarget5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PuzzleActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RemansWallTarget1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RemansWallTarget1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyHavenBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyHavenBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarthspireMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarthspireMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyHavenTempleMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyHavenTempleMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarthspirePillarsTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarthspirePillarsTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyHavenBookMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyHavenBookMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RemansWallTarget3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RemansWallTarget3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarthspireLoadDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarthspireLoadDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyHavenEntryTarget2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyHavenEntryTarget2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarthspireBridgeTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarthspireBridgeTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyHavenEntryTarget1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyHavenEntryTarget1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarthspirePlateTrapTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarthspirePlateTrapTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RemansWallTarget2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RemansWallTarget2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RemansWallTarget4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RemansWallTarget4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
; player cuts hand to activate rings
Game.GetPlayer().PlayIdle(HandCut)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; Esbern arrives at Karthspire
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; Esbern enters inn, or player tells Delphine that he's in Riverwood
RiverwoodScene.Start()
UnregisterForUpdate()
; end MQ202
MQ202.SetStage(300)
; failsafe
Alias_Esbern.GetActorRef().setPlayerTeammate(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; remove force equip of torches
Alias_Delphine.GetActorRef().EquipItem(Torch, false)
Alias_Esbern.GetActorRef().EquipItem(Torch, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; clear ownership and enable book
Alias_SkyHavenBook.GetReference().SetActorOwner(Game.GetPlayer().GetActorBase())
Alias_SkyHavenBook.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; reached the point where ready to ask about Dragonrend Shout
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; player tells Delphine that he found Esbern
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; quickstart at Sky Haven Temple entrance
setstage(1)
setstage(30)
setstage(50)
setstage(60)
Game.GetPlayer().Moveto(Alias_SkyHavenTempleMapMarker.GetRef())
Alias_Esbern.GetRef().Moveto(Alias_SkyHavenTempleMapMarker.GetRef())
Alias_Delphine.GetRef().Moveto(Alias_SkyHavenTempleMapMarker.GetRef())
setstage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE MQ203QuestScript
Quest __temp = self as Quest
MQ203QuestScript kmyQuest = __temp as MQ203QuestScript
;END AUTOCAST
;BEGIN CODE
; Delphine and Esbern meet player at Karthspire
kmyQuest.bMeetAtKarthspire = true
setstage(70)
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player has arrived at Sky Haven Temple entrance
PuzzleScene.Start()
RiverwoodScene.Stop()  ; just in case
KarthspireScene.Stop()
; remove Esbern and Delphine from follower faction
Alias_Delphine.GetActorRef().RemoveFromFaction(PlayerFollowerFaction)
Alias_Esbern.GetActorRef().RemoveFromFaction(PlayerFollowerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
; finish entry scene, start Reman's Wall scene
SkyHavenEntryScene.Stop()
RemansWallScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; quickstart
; debug.trace("MQ Quickstart " + self)
MQ202.setstage(1)
MQ202.setstage(150)
MQ202.setstage(160)
MQ202.setstage(170)
MQ202.setStage(180)
MQ202.setstage(200)
;MQ202.setstage(300)
; debug.trace("MQ Quickstart DONE" + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
setstage(290)
UnregisterForUpdate()
; release reservation of Karthspire
KarthspireReserved.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
; watch for player to arrive in Riverwood
RegisterForUpdate(5)
Actor esbern = Alias_Esbern.GetActorRef()
; add to Blades faction so he's ally of player
esbern.AddToFaction(BladesFaction)
; add to follower faction
esbern.AddToFaction(PlayerFollowerFaction)
; make Esbern a friend
esbern.SetRelationshipRank(Game.GetPlayer(), 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; Delphine and Esbern follow player
; add Esbern and Delphine to follower faction
Alias_Delphine.GetActorRef().AddToFaction(PlayerFollowerFaction)
Alias_Esbern.GetActorRef().AddToFaction(PlayerFollowerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player has solved puzzle, opened door to Sky Haven Temple
Alias_SecretDoor.GetReference().SetOpen(true)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;RegisterForUpdate(1)
; give Delphine a torch
Alias_Delphine.GetRef().AddItem(Torch, 1)
Alias_Delphine.GetActorRef().EquipItem(Torch, true)
; give Esbern a torch
Alias_Esbern.GetRef().AddItem(Torch, 1)
Alias_Esbern.GetActorRef().EquipItem(Torch, true)
; disable collision on back porch
SkyHavenExteriorCollision.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; player activates rings - advance scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; update objective to Sky Haven Temple
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
KarthspireMapMarker.AddToMap()
; give Delphine new outfit - OBSOLETE - she already has outfit from mq106
;Alias_Delphine.GetActorRef().SetOutfit(DelphineArmor)
; add Esbern and Delphine to follower faction
Alias_Delphine.GetActorRef().AddToFaction(PlayerFollowerFaction)
Alias_Esbern.GetActorRef().AddToFaction(PlayerFollowerFaction)
; make sure book is enabled if player skips over that
SetStage(48)
RegisterForUpdate(10) ; watch for player to lead them the wrong way
;Enable the second batch of dragon mounds.
dunDragonMoundQST.SetStage(50)
; add player to Blades faction so he can use stuff in Sky Haven
Game.GetPlayer().AddToFaction(BladesFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; begin Sky Haven Entry scene
PuzzleScene.Stop()
SkyHavenEntryScene.Start()
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; player exits inn, kill scene
RiverwoodScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; player asked to skip ahead
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Esbern has told player about blood seal - allow activation
Alias_PuzzleActivator.GetRef().SetDestroyed(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; quickstart to Reman's Wall
setstage(5)
setstage(140)
setstage(150)
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; player learns secret of Reman's Wall
CompleteAllObjectives()
; add achievement
Game.AddAchievement(5)
MQ204.SetStage(10)
MQ204.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
; Esbern greets Delphine
; watch for Esbern's book event
RegisterForAnimationEvent(Alias_Esbern.GetRef(), "AnimObjectUnequip")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE MQ203QuestScript
Quest __temp = self as Quest
MQ203QuestScript kmyQuest = __temp as MQ203QuestScript
;END AUTOCAST
;BEGIN CODE
; player enters Karthspire Location
; clear meet flag
kmyQuest.bMeetAtKarthspire = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; player approaches pillar puzzle
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; player enters Karthspire worldspace
KarthspireScene.Start()
; remove Esbern and Delphine from follower faction
Alias_Delphine.GetActorRef().RemoveFromFaction(PlayerFollowerFaction)
Alias_Esbern.GetActorRef().RemoveFromFaction(PlayerFollowerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Esbern ready to talk about Sky Haven Temple
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Esbern arrives in Riverwood
Alias_Esbern.GetActorRef().RemoveFromFaction(PlayerFollowerFaction)
Alias_Esbern.GetActorRef().setPlayerTeammate(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property RiverwoodScene  Auto  

Quest Property MQ202  Auto  

Scene Property PuzzleScene  Auto  

Scene Property RemansWallScene  Auto  

Quest Property MQ204  Auto  

Quest Property MQ00  Auto  

ObjectReference Property KarthspireMapMarker  Auto  

ObjectReference Property PuzzleRing1  Auto  
{inner ring}

ObjectReference Property PuzzleRing2  Auto  
{middle ring}

ObjectReference Property PuzzleRing3  Auto  
{outer ring}

Light Property Torch  Auto  

Scene Property SkyHavenEntryScene  Auto  

LocationAlias Property KarthspireReserved  Auto  

Faction Property BladesFaction  Auto  


Outfit Property DelphineArmor  Auto  
{armor for Delphine to wear when she's no longer an innkeeper}

GlobalVariable Property FavorRewardLarge  Auto  

Faction Property PlayerFollowerFaction  Auto  
{put Delphine & Esbern in this to give them follower dialogue}

Scene Property KarthspireScene  Auto  

Idle Property HandCut  Auto  

Quest Property dunDragonMoundQST  Auto  

ObjectReference Property SkyHavenExteriorCollision  Auto  
