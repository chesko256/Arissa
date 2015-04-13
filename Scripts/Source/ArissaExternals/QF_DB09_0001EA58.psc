;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 70
Scriptname QF_DB09_0001EA58 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Noble2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noble2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiannaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiannaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB09AmbushGuard3Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB09AmbushGuard3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TowerTopDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TowerTopDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolPenitusEmpGuard2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolPenitusEmpGuard2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBSancSoldier2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSancSoldier2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolPenitusOutside2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolPenitusOutside2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CommanderMaroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CommanderMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EmperorDecoyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EmperorDecoyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noble1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noble1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noble3Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noble3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaroBridgeMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MaroBridgeMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBSancSoldier4Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSancSoldier4Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolPenitusEmpGuard1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolPenitusEmpGuard1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBSancSoldierAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSancSoldierAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB09BridgeDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB09BridgeDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBSancSoldier3Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSancSoldier3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EscapeMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EscapeMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB09AmbushGuard1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB09AmbushGuard1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarrinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarrinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB09AmbushGuard2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB09AmbushGuard2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolPenitusOutside1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolPenitusOutside1Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
Alias_Noble1Alias.GetReference().Enable()
Alias_Noble2Alias.GetReference().Enable()
Alias_Noble3Alias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE pDB09Script
Quest __temp = self as Quest
pDB09Script kmyQuest = __temp as pDB09Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB07.SetStage (200)
kmyQuest.DB08.SetStage (200)
kmyQuest.DB09.SetStage (5)
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DB07Script Script =  kmyQuest.DB07 as DB07Script
Script.CiceroThreatened = 1
DBScript.pFirstSceneOver = 1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Alias_Noble1Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
;Alias_Noble2Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
;Alias_Noble3Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
;Alias_EmperorDecoyAlias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
Alias_Noble1Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
Alias_Noble2Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
Alias_Noble3Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
Alias_EmperorDecoyAlias.GetActorReference().PlayIdle(ChairEatingSoupStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
pSolitudeTowerDoor.Lock (true)
pSolitudeTowerDoor.SetLockLevel (255)
pTowerBridgeDoor.Lock (true)
pTowerBridgeDoor.SetLockLevel (255)
DaggerEmperor.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;When the Sanctuary Exterior loads, but before the player hits the trigger for DB10 Stage 10,
;we need to enable the Penitus Oculatus and their clutter.
;
;A TrapLinker in the exterior sets this stage; we just pass the call along to DB10 Stage 01.
pDB10.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
pTowerBridgeDoor.Lock (false)
pTowerBridgeDoor.SetLockLevel (50)
pSolitudeTowerDoor.Lock (false)
pSolitudeTowerDoor.SetLockLevel (50)
Game.EnableFastTravel(true)
SetObjectiveCompleted (70)
Alias_CommanderMaroAlias.GetActorRef().EquipItem(Torch, false)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;SetObjectiveCompleted (20)

If IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
Endif

If IsObjectiveDisplayed(25)
   SetObjectiveCompleted(25)
Endif

SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE pDB09Script
Quest __temp = self as Quest
pDB09Script kmyQuest = __temp as pDB09Script
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().Moveto(Alias_AstridAlias.GetReference())
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (200)
kmyQuest.DB05.SetStage (200)
kmyQuest.DB06.SetStage (200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
pSolitudeTowerInteriorDoor.Lock (true)
pSolitudeTowerInteriorDoor.SetLockLevel (255)
;Actor Gianna = Alias_GiannaAlias.GetReference() as Actor
;Gianna.SetGhost(True)
Game.GetPlayer().StopCombatAlarm()
HaafingarFaction.SetPlayerEnemy(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted (40)
SetObjectiveDisplayed(50, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Alias_Noble1Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
Actor Gianna = Alias_GiannaAlias.GetReference() as Actor
Gianna.SetGhost(True)
Game.GetPlayer().StopCombatAlarm()
HaafingarFaction.SetPlayerEnemy(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
pDBEntranceQuestScript Script = pDBEntranceQuest as pDBEntranceQuestScript
Script.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
pTowerBridgeDoor.Lock (true)
pTowerBridgeDoor.SetLockLevel (255)
Game.EnablePlayerControls()
Game.EnableFastTravel(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
setObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
pDB08.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
DarkSanctuaryDialogueScript SanctuaryScript = pSanctuaryDialogue as DarkSanctuaryDialogueScript
SanctuaryScript.AstridFirstGreet = 1
SanctuaryScript.FestusFirstGreet = 1
SanctuaryScript.NazirFirstGreet = 1
SanctuaryScript.GabriellaFirstGreet = 1
SanctuaryScript.BabetteFirstGreet = 1
SanctuaryScript.VeezaraFirstGreet = 1
SanctuaryScript.ArnbjornFirstGreet = 1
SanctuaryScript.CiceroFirstGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Utility.Wait(5)
;pDB09Script Script = pDB09 as pDB09Script
;Script.pGiannaStand = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE pDB09Script
Quest __temp = self as Quest
pDB09Script kmyQuest = __temp as pDB09Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (5)
SetObjectiveDisplayed(10, 1)
game.GetPlayer().AddItem(Alias_JarrinAlias.GetReference())
Alias_CommanderMaroAlias.GetReference().Enable()
Alias_CommanderMaroAlias.GetReference().Moveto (kmyQuest.MaroSolitudeMarker)
Alias_GiannaAlias.GetReference().Enable()
;Alias_EmperorDecoyAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
Alias_CommanderMaroAlias.GetReference().Moveto (pMaroTowerMarker)
Actor CommanderMaro = Alias_CommanderMaroAlias.GetReference() as Actor
CommanderMaro.SetGhost(True)
Actor Gianna = Alias_GiannaAlias.GetReference() as Actor
Gianna.SetGhost(False)
pDB09Script Script = pDB09 as pDB09Script
Script.pMaroPosition = 1
pDiningRoomDoor.Lock (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted (50)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
Alias_GiannaAlias.GetActorReference().GetActorBase().SetEssential (false)
pTowerBridgeDoor.Lock (false)
DBMapMarker.Disable()
Game.EnableFastTravel(false)
Alias_CommanderMaroAlias.GetReference().Moveto (pMaroTowerMarker)
TrapMarker.Enable()
Alias_CommanderMaroAlias.GetRef().AddItem(Torch, 1)
Alias_CommanderMaroAlias.GetActorRef().EquipItem(Torch, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;FestusKrexMarker.Enable()
FestusBlood.Enable()
FestusBody.Enable()
;HaafingarFaction.ModCrimeGold(3000)
HaafingarFaction.SetPlayerEnemy(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
SetObjectiveDisplayed (20, 0)
SetObjectiveDisplayed(25, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
Alias_SolPenitusEmpGuard1Alias.GetReference().Enable()
Alias_SolPenitusEmpGuard2Alias.GetReference().Enable()
Alias_DB09AmbushGuard1Alias.GetReference().Enable()
Alias_DB09AmbushGuard2Alias.GetReference().Enable()
Alias_DB09AmbushGuard3Alias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(40, 1)
Alias_EmperorDecoyAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE pDB09Script
Quest __temp = self as Quest
pDB09Script kmyQuest = __temp as pDB09Script
;END AUTOCAST
;BEGIN CODE
Alias_SolPenitusOutside1Alias.GetReference().Enable()
Alias_SolPenitusOutside2Alias.GetReference().Enable()
;Alias_SolPenitusEmpGuard1Alias.GetReference().Enable()
;Alias_SolPenitusEmpGuard2Alias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted (60)
SetObjectiveDisplayed(70, 1)
Alias_DBSancSoldierAlias.GetReference().Enable()
Alias_DBSancSoldier2Alias.GetReference().Enable()
Alias_DBSancSoldier3Alias.GetReference().Enable()
Alias_DBSancSoldier4Alias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE pDB09Script
Quest __temp = self as Quest
pDB09Script kmyQuest = __temp as pDB09Script
;END AUTOCAST
;BEGIN CODE
;Alias_Noble1Alias.GetReference().Enable()
;Alias_Noble2Alias.GetReference().Enable()
;Alias_Noble2Alias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pSanctuaryDialogue  Auto  

ObjectReference Property pMaroTowerMarker  Auto  

Quest Property pDB09  Auto  

ObjectReference Property pSolitudeTowerDoor  Auto  

ObjectReference Property pTowerBridgeDoor  Auto  

ObjectReference Property pSolitudeTowerInteriorDoor  Auto  

ObjectReference Property DBMapMarker  Auto  

Quest Property DB05  Auto  

ObjectReference Property pDiningRoomDoor  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

Quest Property pDBEntranceQuest  Auto  

Quest Property pDB08  Auto  

ObjectReference Property FestusKrexMarker  Auto  

ObjectReference Property DaggerEmperor  Auto  

Quest Property pDB10  Auto  

ObjectReference Property FestusBody  Auto  

ObjectReference Property FestusBlood  Auto  

idle Property ChairEatingSoupStart  Auto  

ObjectReference Property TrapMarker  Auto  

Faction Property HaafingarFaction  Auto  

Light Property Torch  Auto  
