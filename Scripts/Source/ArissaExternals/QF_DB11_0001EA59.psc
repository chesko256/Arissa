;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 68
Scriptname QF_DB11_0001EA59 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PaymentAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PaymentAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RexusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RexusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmaundMotierreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmaundMotierreAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EmperorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EmperorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatariahChainAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatariahChainAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetMarker1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetMarker1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CommanderMaroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CommanderMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VolunruudUrnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VolunruudUrnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EmperorExitDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EmperorExitDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetMarker2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetMarker2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BabetteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BabetteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusDocksAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PenitusDocksAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Update the Sanctuary's state.
DBSanc_DB10PostFire_Enable.Enable()
DBSanc_DB10PostFire_Disable.Disable()
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
pDawnstarDoor1.Enable()
pDawnstarDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(40, 1)

;Stop the Katariah quest.
DB11_dunKatariahQST.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (15)
SetObjectiveDisplayed(20, 1)
;kmyQuest.pTitusMedeII.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
Alias_AmaundMotierreAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_RexusAlias.GetActorReference().GetActorBase().SetEssential (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(50, 1)
;kmyQuest.pNightMotherCoffinDawnstar.Enable()
;Alias_NightMotherAlias.GetReference().Moveto (NightMotherDawnstarMarker)
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

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;Alias_AmaundMotierreAlias.GetActorReference().GetActorBase().SetEssential (false)
;Alias_RexusAlias.GetActorReference().GetActorBase().SetEssential (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;Katariah Management -- Disable the Katariah
;NOT SET UP at the moment -- link in later if desired.
KatariahEnableMarker.Disable()
KatariahSealedDoor.Disable()
KatariahUnsealedDoor.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
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

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
pDarkAstrid.Disable()
pDarkVeezara.Disable()
pDarkArnbjorn.Disable()
pDarkFestus.Disable()
pDarkGabriella.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DBScript.pFirstSceneOver=1
DB07Script Script =  kmyQuest.DB07 as DB07Script
Script.CiceroThreatened = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (50)
SetObjectiveDisplayed(60, 1)
;kmyQuest.pDB11Urn.Enable()
Alias_VolunruudUrnAlias.GetRef().Disable()
;kmyQuest.pVolunruudUrn.Disable()
Alias_PaymentAlias.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
Game.IncrementStat( "Questlines Completed" )
SetObjectiveCompleted (80)
Game.AddAchievement(20)
DBRepairQuest.SetStage (10)
;Utility.Wait(5)
;pNightMotherDawnstarScene.Start()
;Utility.Wait(5)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;Katariah Management -- Enable the Katariah and Sealed Door.
KatariahEnableMarker.Enable()
KatariahSealedDoor.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
pNightMotherCoffin.Enable()
NightMotherLakeCorpse.Enable()
Alias_NightMotherAlias.GetReference().Moveto (pNightMotherMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Katariah Management -- Swap the Sealed and Unsealed Doors.
KatariahSealedDoor.Disable()
KatariahUnsealedDoor.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB07.SetStage (200)
kmyQuest.DB08.SetStage (200)
kmyQuest.DB09.SetStage (200)
kmyQuest.DB10.SetStage (80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
DawnstarEnableMarker.Disable()
kmyQuest.NewNightMotherCoffin.Enable()
NightMotherCoffinLake.Disable()
NightMotherLakeCorpse.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (5)
SetObjectiveDisplayed(10, 1)
kmyQuest.pAmaundMotierre.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (200)
kmyQuest.DB05.SetStage (200)
kmyQuest.DB06.SetStage (200)

;Sanctuary Setup
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (60)
SetObjectiveDisplayed(80, 1)
kmyQuest.pNightMotherCoffinDawnstar.Enable()
NMBodyDawnstarRef.Enable()
Alias_NightMotherAlias.GetReference().Moveto (NightMotherDawnstarMarker)
;kmyQuest.pDarkNazir.GetRef().Enable()
Alias_NazirAlias.GetRef().Enable()
Alias_NazirAlias.GetReference().Moveto (pNazirDawnstarCoffinMarker)
Alias_BabetteAlias.GetReference().Moveto (pNazirDawnstarCoffinMarker)
DawnstarEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pTitusMedeII.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
Alias_RexusAlias.GetReference().Enable()
Alias_RexusAlias.GetReference().Moveto (pRexusMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
Alias_PenitusDocksAlias.GetReference().Enable()
Alias_CommanderMaroAlias.GetReference().Enable()
Alias_CommanderMaroAlias.GetReference().Moveto (pMaroDocksMarker)
Alias_CommanderMaroAlias.GetActorReference().GetActorBase().SetEssential (false)
Actor CommanderMaro = Alias_CommanderMaroAlias.GetReference() as Actor
CommanderMaro.SetGhost(False)
;Enable the Katariah
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
Alias_BabetteAlias.GetReference().Enable()
Alias_NazirAlias.GetReference().Enable()
Alias_NazirAlias.GetReference().Moveto (pNazirStartMarker)
Alias_BabetteAlias.GetReference().Moveto (pBabetteStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pBlackDoorRef.Enable()
kmyQuest.pNightMother.Enable()
kmyQuest.pNightMotherCoffin.Enable()
KmyQuest.RegisterForUpdate(5)
;Game.GetPlayer().Moveto(Alias_NightMotherAlias.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
SetObjectiveDisplayed(5)
Alias_CommanderMaroAlias.GetReference().Disable()
Actor CommanderMaro = Alias_CommanderMaroAlias.GetReference() as Actor
CommanderMaro.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE pDB11Script
Quest __temp = self as Quest
pDB11Script kmyQuest = __temp as pDB11Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted (10)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted (60)
SetObjectiveDisplayed(70, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property NightMotherDawnstarMarker  Auto  

ObjectReference Property pAmaundMotierreRef  Auto  

Quest Property pDB11  Auto  

ObjectReference Property pNazirDawnstarCoffinMarker  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pSanctuaryDialogue  Auto  

ObjectReference Property pMaroDocksMarker  Auto  

ObjectReference Property pNazirStartMarker  Auto  

ObjectReference Property pBabetteStartMarker  Auto  

ObjectReference Property pRexusMarker  Auto  

ObjectReference Property pNightMotherCoffin  Auto  

ObjectReference Property pNightMotherMarker  Auto  

ObjectReference Property pDarkAstrid  Auto  

ObjectReference Property pDarkVeezara  Auto  

ObjectReference Property pDarkFestus  Auto 

ObjectReference Property pDarkGabriella  Auto  

ObjectReference Property pDarkArnbjorn  Auto 

ObjectReference Property DBSanc_DB10Fire_Enable Auto 
ObjectReference Property DBSanc_DB10Fire_Disable Auto 

ObjectReference Property DBSanc_DB10PostFire_Enable Auto 
ObjectReference Property DBSanc_DB10PostFire_Disable Auto 

ObjectReference Property DBSanc_NMMovesIn_Enable Auto  
ObjectReference Property DBSanc_NMMovesIn_Disable Auto  

ObjectReference Property DBSanc_NMMovesOut_Enable Auto  
ObjectReference Property DBSanc_NMMovesOut_Disable Auto  

Quest Property DBRecurring  Auto  

Scene Property pNightMotherDawnstarScene  Auto  

Quest Property DBRepairQuest  Auto  

Quest Property DB05  Auto  

ObjectReference Property DawnstarEnableMarker  Auto  

ObjectReference Property pDawnstarDoor1  Auto  

ObjectReference Property pDawnstarDoor2  Auto  

ObjectReference Property KatariahEnableMarker  Auto  

ObjectReference Property KatariahSealedDoor  Auto  

ObjectReference Property KatariahUnsealedDoor  Auto  

ObjectReference Property DBSanc_DB10CorpsePile_Toggle  Auto  

ObjectReference Property DBSanc_DB10DuringAndPostFire_Enable  Auto  

ObjectReference Property DBSanc_DB10DuringAndPostFire_Disable  Auto  

Quest Property DB11_dunKatariahQST  Auto  

ObjectReference Property NightMotherCoffinLake  Auto  

ObjectReference Property NightMotherLakeCorpse  Auto  

ObjectReference Property NMBodyDawnstarRef  Auto  
