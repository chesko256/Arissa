;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 68
Scriptname QF_DB10_0003CEDA Extends Quest Hidden

;BEGIN ALIAS PROPERTY PenitusSoldier3Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridEndAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AstridEndAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutdoorSoldier2Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OutdoorSoldier2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier2Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutdoorSoldier3Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OutdoorSoldier3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier1Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutdoorSoldier1Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OutdoorSoldier1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NMCoffinAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NMCoffinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldierArnbjorn1Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldierArnbjorn1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldierArnbjorn2Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldierArnbjorn2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier6Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier6Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BabetteAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BabetteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackDoorAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BlackDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier7Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier7Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier4Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier4Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BladeOfWoeAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BladeOfWoeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NMCoffinLakeAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NMCoffinLakeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusSoldier5Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PenitusSoldier5Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornWerewolfAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArnbjornWerewolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutdoorSoldier4Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OutdoorSoldier4Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDarkFestus.Disable()
kmyQuest.pDarkGabriella.Disable()
;kmyQuest.pDarkNazirSancAttack.Enable()
;kmyQuest.pDarkNazir.Disable()
Alias_NazirAlias.GetReference().Moveto (pNazirSancFightMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB07.SetStage (200)
kmyQuest.DB08.SetStage (200)
kmyQuest.DB09.SetStage (70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (60)
SetObjectiveDisplayed(70, 1)
Actor AstridEnd = Alias_AstridEndAlias.GetReference() as Actor
AstridEnd.SetGhost(False)
AstridEnd.SetRestrained(0)
Alias_AstridEndAlias.GetActorRef().GetActorBase().SetEssential (false)

pDB10Script  Script = DB10 as pDB10Script
if Script.HaveBlade == 0
    DB10.SetObjectiveDisplayed (81,1)
    Script.HaveBlade = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDarkAstrid.Disable()
kmyQuest.pDarkVeezara.Disable()
kmyQuest.pDarkBabette.Disable()
kmyQuest.pDarkArnbjorn.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(35)
Actor Nazir = Alias_NazirAlias.GetReference() as Actor
Nazir.SetGhost(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
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

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;(kmyQuest.pImperialOfficerRef as Actor).StartCombat(Game.GetPlayer())
kmyQuest.pSancOfficer1.Enable()
kmyQuest.pSancOfficer2.Enable()
DBMapMarker.Enable()
DBMapMarker.AddToMap()

;Just in case we haven't hit this already...
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
pChamberDoor.Lock (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Seal the Dining Room when the player enters.
;Sanctuary State Changes
DBSanc_SealDiningRoomCollision.Enable()
Game.GetPlayer().RampRumble(4, 1, 1600)
Game.ShakeCamera()
Utility.Wait(0.5)
DBSanc_DiningHallBeam.PlayAnimation("playAnim01")
DBSanc_NMRoomBeam.PlayAnimation("playAnim01")
Utility.Wait(1.15)
FireballExplosionPoint.PlaceAtMe(FireballExplosion)
DBSanc_SealDiningRoom_Enable.Enable()
DBSanc_SealDiningRoom_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;SetObjectiveCompleted (20)
SetObjectiveCompleted (15)
SetObjectiveDisplayed(30, 1)
Alias_PenitusSoldier5Alias.GetActorRef().GetActorBase().SetEssential (false)
Alias_NazirAlias.GetActorRef().StartCombat(Alias_PenitusSoldier5Alias.GetActorRef())
Alias_PenitusSoldier5Alias.GetActorRef().StartCombat(Alias_NazirAlias.GetActorRef())
Alias_PenitusSoldier5Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pBlackDoorRef.Enable()
kmyQuest.pNightMother.Enable()
kmyQuest.pNightMotherCoffin.Enable()
kmyQuest.NMCoffin.Enable()
kmyQuest.NMCoffin.Lock (false)
KmyQuest.RegisterForUpdate(5)
NightMotherBodyRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (50)
SetObjectiveDisplayed(60, 1)
kmyQuest.pDarkAstridEnd.Enable()
Utility.Wait(5)
Actor AstridEnd = Alias_AstridEndAlias.GetReference() as Actor
;AstridEnd.SetRestrained(1)
AstridEnd.SetGhost(True)
;Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pSancOfficer3.Enable()
kmyQuest.pSancOfficer4.Enable()
kmyQuest.pSancOfficer5.Enable()
;kmyQuest.pSancOfficer6.Enable()
kmyQuest.pSancOfficer7.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pSancOfficer1.Disable()
kmyQuest.pSancOfficer2.Disable()
kmyQuest.pSancOfficer3.Disable()
kmyQuest.pSancOfficer4.Disable()
kmyQuest.pSancOfficer5.Disable()
kmyQuest.pSancOfficer6.Disable()
kmyQuest.pSancOfficer7.Disable()
Alias_PenitusBoss.GetActorRef().Disable()
Alias_BabetteAlias.GetActorReference().EvaluatePackage()


;Sanctuary State Changes

DBSanc_DB10Fire_Enable.Disable()
DBSanc_DB10Fire_Disable.Enable()

DBSanc_SealDiningRoom_Enable.Disable()
DBSanc_SealDiningRoom_Disable.Disable()

DBSanc_DB10PostFire_Enable.Enable()
DBSanc_DB10PostFire_Disable.Disable()

DBSanc_NMMovesIn_Enable.Disable()
DBSanc_NMMovesIn_Disable.Enable()

DBSanc_NMMovesOut_Enable.Enable()
DBSanc_NMMovesOut_Disable.Disable()

DBSanc_PreFireLighting.Disable()
DBSanc_SealDiningRoom_Enable.Disable()
DBSanc_DB10CorpsePile_Toggle.Enable()
(DBSanc_DB10_SanctuaryLoadManager as DBSanctuaryDB10LoadCheck).RunLoadCheck()

Alias_ArnbjornWerewolfAlias.GetReference().Disable()
Alias_PenitusSoldierArnbjorn1Alias.GetReference().Disable()
Alias_PenitusSoldierArnbjorn2Alias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Remove invulnerability on Arnbjorn and the nearby Penitus soldiers.
Alias_ArnbjornWerewolfAlias.GetActorRef().SetGhost(False)
Alias_PenitusSoldierArnbjorn1Alias.GetActorRef().SetGhost(False)
Alias_PenitusSoldierArnbjorn2Alias.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Failsafe: Kill Arnbjorn when the two soldiers near him are dead.
Alias_ArnbjornWerewolfAlias.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DB07Script Script =  kmyQuest.DB07 as DB07Script
Script.CiceroThreatened = 1
DBScript.pFirstSceneOver = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted (70)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(15, 1)
Alias_NazirAlias.GetActorRef().StartCombat(Alias_PenitusSoldier5Alias.GetActorRef())
Alias_PenitusSoldier5Alias.GetActorRef().StartCombat(Alias_NazirAlias.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
Alias_BladeOfWoeAlias.GetActorRef().Enable()
Alias_BabetteAlias.GetActorReference().EvaluatePackage()
Actor Nazir = Alias_NazirAlias.GetReference() as Actor
Nazir.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;SetObjectiveCompleted (30)
SetObjectiveCompleted (35)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted (40)
SetObjectiveDisplayed(50, 1)
pChamberDoor.Lock (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Sanctuary State Change Failsafe
DBSanc_DB10DuringAndPostFire_Enable.Enable()
DBSanc_DB10DuringAndPostFire_Disable.Disable()

DBSanc_DB10Fire_Enable.Disable()
DBSanc_DB10Fire_Disable.Enable()

DBSanc_DB10PostFire_Enable.Enable()
DBSanc_DB10PostFire_Disable.Disable()

DBSanc_NMMovesIn_Enable.Disable()
DBSanc_NMMovesIn_Disable.Enable()

DBSanc_NMMovesOut_Enable.Enable()
DBSanc_NMMovesOut_Disable.Disable()

DBSanc_PreFireLighting.Disable()
DBSanc_SealDiningRoom_Enable.Disable()
DBSanc_DB10CorpsePile_Toggle.Enable()



SetObjectiveCompleted (80)

pDB10Script  Script = DB10 as pDB10Script
if DB10.IsObjectiveDisplayed (81)
    DB10.SetObjectiveDisplayed (81,0)
endif

Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
Actor Nazir = Alias_NazirAlias.GetReference() as Actor
Nazir.SetGhost(True)

Actor Attacker1 = Alias_PenitusSoldier5Alias.GetReference() as Actor
Attacker1.SetGhost(True)

pChamberDoor.Lock (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE pDB10Script
Quest __temp = self as Quest
pDB10Script kmyQuest = __temp as pDB10Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDarkVeezaraDead.Enable()
kmyQuest.pDarkGabriellaDead.Enable()
kmyQuest.pLisDead.Enable()
kmyQuest.pLis.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;Sanctuary State Changes
DBSanc_DB10DuringAndPostFire_Enable.Enable()
DBSanc_DB10DuringAndPostFire_Disable.Disable()
DBSanc_DB10Fire_Enable.Enable()
DBSanc_DB10Fire_Disable.Disable()
(DBSanc_DB10_SanctuaryLoadManager as DBSanctuaryDB10LoadCheck).RunLoadCheck()

;Make sure the right door is enabled.
DBSanc_NotAstridDoor.Disable()
DBSanc_AstridDoor.Disable()
FusedDoor.Enable()

;Removes the last pair of plates.
DBSanc_DBX_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Enable Arnbjorn and the soldiers fighting him late, so as not to interrupt the initial scene.
Alias_ArnbjornWerewolfAlias.GetActorRef().Enable()
Alias_PenitusSoldierArnbjorn1Alias.GetActorRef().Enable()
Alias_PenitusSoldierArnbjorn2Alias.GetActorRef().Enable()
Utility.Wait(0.1)
Alias_ArnbjornWerewolfAlias.GetActorRef().EvaluatePackage()
Alias_PenitusSoldierArnbjorn1Alias.GetActorRef().EvaluatePackage()
Alias_PenitusSoldierArnbjorn2Alias.GetActorRef().EvaluatePackage()

;Increase the health of Nazir's opponent.
Alias_PenitusSoldier5Alias.GetActorRef().SetAV("Health", Alias_PenitusSoldier5Alias.GetActorRef().GetAV("Health") * 1.5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pSanctuaryDialogue  Auto  

ObjectReference Property pNazirSancFightMarker  Auto  

ObjectReference Property DBSanc_DB10PostFire_Enable Auto  
ObjectReference Property DBSanc_DB10PostFire_Disable Auto  

ObjectReference Property DBSanc_DB10Fire_Enable  Auto  
ObjectReference Property DBSanc_DB10Fire_Disable  Auto  

ObjectReference Property DBSanc_NMMovesOut_Enable Auto  
ObjectReference Property DBSanc_NMMovesOut_Disable Auto  

ObjectReference Property DBSanc_NMMovesIn_Enable  Auto  
ObjectReference Property DBSanc_NMMovesIn_Disable  Auto  

ObjectReference Property DBSanc_DB10_FireShakeRumble  Auto  

Quest Property DB10  Auto  

ObjectReference Property DBMapMarker  Auto  

Quest Property DB05  Auto  

ImagespaceModifier Property FireIM  Auto  

ObjectReference Property DBSanc_PreFireLighting  Auto  

Faction Property DBAttackPlayerFaction  Auto  

ObjectReference Property DBSanc_DB10DuringAndPostFire_Enable  Auto  

ObjectReference Property DBSanc_DB10DuringAndPostFire_Disable  Auto  

ObjectReference Property DBSanc_DB10CorpsePile_Toggle  Auto  

ObjectReference Property DBSanc_SealDiningRoom_Enable  Auto  

ObjectReference Property pChamberDoor  Auto  

ObjectReference Property DBSanc_DB10_SanctuaryLoadManager  Auto  

ObjectReference Property DBSanc_DBX_Disable  Auto  

ObjectReference Property DBSanc_AstridDoor  Auto  

ObjectReference Property DBSanc_NotAstridDoor  Auto  

ObjectReference Property FusedDoor  Auto  

ObjectReference Property DBSanc_SealDiningRoom_Disable  Auto  

ObjectReference Property DBSanc_SealDiningRoomCollision  Auto   

ObjectReference Property DBSanc_DiningHallBeam  Auto  

Explosion Property FireballExplosion  Auto  

ObjectReference Property FireballExplosionPoint  Auto  

ObjectReference Property DBSanc_NMRoomBeam  Auto  

ObjectReference Property NightMotherBodyRef  Auto  
