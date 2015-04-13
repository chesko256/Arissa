;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 76
Scriptname QF_MQ106_00032926 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Roggi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Roggi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_KynesgroveLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard2Disabled
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard2Disabled Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dravynea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dravynea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KjeldtheYounger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KjeldtheYounger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard3Disabled
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard3Disabled Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kjeld
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kjeld Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveTargetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveTargetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ganna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ganna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard1Disabled
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard1Disabled Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveCivilian2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveCivilian2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveCivilian1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveCivilian1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KynesgroveGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KynesgroveGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Iddra
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Iddra Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
; done with second exclusive branch - you're dragonborn
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
UnRegisterForUpdate()
; give player key to Delphine's secret room
Game.GetPlayer().AddItem(MQDelphineSecretDoorKey, 1)
Alias_Delphine.GetRef().AddItem(MQDelphineSecretDoorKey, 1)
; unlock Delphine's room again, just in case
DelphineSecretDoor.Lock(false)
MQ201.SetActive()
; quest complete
CompleteAllObjectives()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; player enters Kynesgrove
setstage(60) ; failsafe - should have fired already, but just in case
; move Delphine if she's not nearby
Alias_Delphine.GetRef().MovetoIfUnloaded(KynesgroveMoveMarker)
LeaveRiverwoodScene.Stop()
KynesgroveScene.Start()
Alias_Alduin.GetActorRef().EvaluatePackage()
AlduinWeather.SetActive(true, true)
; remove Delphine's torch
Alias_Delphine.GetRef().RemoveItem(Torch01, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
; Delphine mentions why she took horn - skip that in next part
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
; Delphine gears up for trip to Kynesgrove
Actor delphine = Alias_Delphine.GetActorRef()
delphine.SetOutfit(DelphineOutfit)
delphine.AddItem(Bow)
delphine.AddItem(Arrows, 15)
delphine.AddItem(DelpineSword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; player has entered room
IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; debug.trace(self + " stage 100 - start resurrection")
; trigger dragon resurrection
; debug.trace(self + " StartResurrection()...")
DragonMound.StartResurrection()
; debug.trace(self + " StartResurrection() DONE")
; Alduin can escape now
; reset guards' aggression
Alias_KynesgroveGuard.GetActorRef().SetActorValue("aggression", 1)
Alias_KynesgroveGuard2.GetActorRef().SetActorValue("aggression", 1)
Alias_KynesgroveGuard3.GetActorRef().SetActorValue("aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; both Delphine and player are in room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
; complete objective
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; quickstart
; debug.trace("MQ Quickstart " + self)
MQ105.setstage(1)
MQ105.setstage(30)
MQ105.setstage(70)
MQ105.setstage(120)
MQ105.setstage(140)
MQ105.setstage(200)
; debug.trace("MQ Quickstart DONE" + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
; resurrection process done
; complete objective
setstage(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
; player leaves Riverwood
LeaveRiverwoodScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; Alduin disabled
Alias_Alduin.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
; start resurrection scene
; keep making sure weather is going (in case player left in between)
AlduinWeather.SetActive(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; guard scripts load
AlduinLoopingScene.Start()
; register for player LOS on Alduin
RegisterForSingleLOSGain(Alias_Player.GetActorRef(), Alias_Alduin.GetActorRef())
; make sure all dead
Alias_KynesgroveGuard.GetActorRef().Kill()
Alias_KynesgroveGuard2.GetActorRef().Kill()
Alias_KynesgroveGuard3.GetActorRef().Kill()
Alias_KynesgroveGuard1Disabled.GetActorRef().Kill()
Alias_KynesgroveGuard2Disabled.GetActorRef().Kill()
Alias_KynesgroveGuard3Disabled.GetActorRef().Kill()
; make guards temporarily unaggressive
Alias_KynesgroveGuard.GetActorRef().SetActorValue("aggression", 0)
Alias_KynesgroveGuard2.GetActorRef().SetActorValue("aggression", 0)
Alias_KynesgroveGuard3.GetActorRef().SetActorValue("aggression", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; player has told Delphine he's not interested
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
; player has closed door, Delphine opens secret door, ready to talk
DelphineSecretDoor.Lock(false)
DelphineSecretDoor.SetOpen(true)
DelphineSecretDoor2.SetOpen(true)
MQ106DelphineBedroomTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQ106Script
Quest __temp = self as Quest
MQ106Script kmyQuest = __temp as MQ106Script
;END AUTOCAST
;BEGIN CODE
; player has rented room
; enable room trigger box
InnRoomTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; stop dragon death sequence
DragonDeathScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; dragon death sequence finished
UnregisterForUpdate()
; start MQ201
MQ201.setstage(10)
; turn on random dragons (WI and WE)
MQ106TurnOffRandomDragons.SetValue(0)
; put Kynesgrove back in war
CW.AddGarrisonBackToWar(Alias_KynesgroveLocation.GetLocation())
; failsafe:
; Blades now enemy of dragons
BladesFaction.SetEnemy(DragonFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
; player gets near burial mound, start Alduin scene
; begin dragon resurrection scene
AlduinScene.Start()
; just in case
KynesgroveScene.Stop()
AlduinLoopingScene.Stop()
LeaveRiverwoodScene.Stop()
Alias_Alduin.GetActorRef().EvaluatePackage()
; make sure weather changes
AlduinWeather.SetActive(true, true)
; REMOVED - this was causing more problems than it was solving
; failsafe - these guys should already be dead
;Alias_KynesgroveGuard.GetActorRef().Kill()
;Alias_KynesgroveGuard2.GetActorRef().Kill()
;Alias_KynesgroveGuard3.GetActorRef().Kill()
;Alias_KynesgroveGuard1Disabled.GetActorRef().Kill()
;Alias_KynesgroveGuard2Disabled.GetActorRef().Kill()
;Alias_KynesgroveGuard3Disabled.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; player learns where the mound is located
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; debug.trace(self + " stage 110 - make dragon aggressive")
; failsafe
SetStage(100)
; complete objective
setstage(102)
; make Sahloknir aggressive
Alias_Dragon.GetActorRef().setActorValue("aggression", 1)
; Blades now enemy of dragons
BladesFaction.SetEnemy(DragonFaction)
; end scene
AlduinScene.Stop()
Weather.ReleaseOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; player approaches dragon, triggers death sequence
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
; player has said he recognizes Delphine
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; dragon is dead
; failsafe - make sure Alduin is disabled
SetStage(120)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
DragonDeathScene.Start()
Alias_Delphine.GetRef().AddItem(Torch01, 1) ; give her back her torch
Alias_Delphine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;first exclusive branch - "I just came for the horn" "Just hear me out"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; turn on quest when player finds note
; turn off random dragons (WI and WE) so you don't have dragons around on way to Kynesgrove
MQ106TurnOffRandomDragons.SetValue(1)
; enable map in secret room
DragonMap.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
; done with 3rd exclusive - unlock last exit topic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Delphine returns horn, starts first MQ106 objective
SetObjectiveDisplayed(10)
MQ105.SetStage(220)
if MQ105Ustengrav.IsActive()
	SetActive()
endif
;Delphine no longer treated as the innkeeper
Alias_Orgnar.GetActorRef().AddToFaction(RentRoomFaction)
Alias_Delphine.GetActorRef().RemoveFromFaction(RentRoomFaction)
Alias_Delphine.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2) ; make confidant
;InnRoomDoor.SetOpen(false)
MQ106DelphineInRoomTrigger.Enable()
MQ106DelphineBedroomTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player has gotten quest from Delphine
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
; make MQ106 active so you get QT
SetActive(true)
KynesgroveMapMarker.AddToMap()
LeaveRiverwoodScene.Start()
; remove Kynesgrove from CW for duration (so guards won't respawn/town change hands)
CW.RemoveGarrisonFromWar(Alias_KynesgroveLocation.GetLocation())
; enable Alduin
Alias_Alduin.GetRef().Enable()
; Blades are now allies of player
BladesFaction.SetAlly(PlayerFaction)
; stop intro scene
IntroScene.Stop()
InnRoomTrigger.Disable()
MQ106DelphineInRoomTrigger.Disable()
; turn on dragon in mound
Alias_dragon.GetActorRef().SetForcedLandingMarker(DragonLandingMarker)
Alias_dragon.GetActorRef().Enable()
DragonMound.isDragonHome = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
; Delphine enters burial mound location
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
; learn of dragon attack from Kynesgrove NPCs
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105  Auto  

Scene Property IntroScene  Auto  

Scene Property AlduinScene  Auto  

Scene Property DragonDeathScene  Auto  

Scene Property LeaveRiverwoodScene  Auto  

Scene Property KynesgroveScene  Auto  

Quest Property MQ00  Auto  

ObjectReference Property KynesgroveMapMarker  Auto  

Quest Property MQ201  Auto  

Weapon Property Bow  Auto  
{bow for Delphine}

Ammo Property Arrows  Auto  
{arrows for Delphine}

ObjectReference Property InnRoomTrigger  Auto  

Quest Property DialogueRiverwood  Auto  

Faction Property BladesFaction  Auto  

Faction Property PlayerFaction  Auto  

Faction Property RentRoomFaction  Auto  

ObjectReference Property DragonLandingMarker  Auto  

Outfit Property DelphineOutfit  Auto  
{what she wears when out of the inn
}


ObjectReference Property KynesgroveMoveMarker  Auto  
{marker to move Delphine to if necessary}

GlobalVariable Property MQ106TurnOffRandomDragons  Auto  
{set to 1 to turn off random dragons (WI and WE)}

ObjectReference Property GuardDeadMarker  Auto  

Scene Property AlduinLoopingScene  Auto  
{scene for Alduin before player arrives near mound}

FXDragonMoundScript Property DragonMound  Auto  

ObjectReference Property InnRoomDoor  Auto  
{door to player's room in Riverwood}

CWScript Property CW  Auto  

ObjectReference Property MQ106DelphineInRoomTrigger  Auto  

ObjectReference Property DelphineSecretDoor  Auto  

Key Property MQDelphineSecretDoorKey  Auto  

ObjectReference Property MQ106DelphineBedroomTrigger  Auto  

ObjectReference Property DelphineSecretDoor2  Auto  
{back panel of secret door}

ObjectReference Property DragonMap  Auto  

Weather Property AlduinWeather  Auto  

Light Property Torch01  Auto  

Faction Property DragonFaction  Auto  

Weapon Property DelpineSword  Auto  

Quest Property MQ105Ustengrav  Auto  
