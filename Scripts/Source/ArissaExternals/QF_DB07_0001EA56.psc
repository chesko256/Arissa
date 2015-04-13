;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 44
Scriptname QF_DB07_0001EA56 Extends Quest Hidden

;BEGIN ALIAS PROPERTY VeezaraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VeezaraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShadowmereTargetMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShadowmereTargetMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShadowmereAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShadowmereAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JournalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JournalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArnbjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BabetteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BabetteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GaiusMaroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GaiusMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
DB06Script Script = DB06 as DB06Script
Script.pPlantedLetter = 1
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_GaiusMaroAlias.GetActorReference().Kill(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
CiceroJournal1.Enable()
CiceroJournal2.Enable()
CiceroJournal3.Enable()
CiceroJournal4.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (40)
SetObjectiveDisplayed(50, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().Moveto (kmyQuest.SanctuaryEnterMarker)
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (200)
kmyQuest.DB05.SetStage (200)
kmyQuest.DB06.SetStage (30)
kmyQuest.NightMotherCoffin.Enable()
kmyQuest.DBNightMotherCoffin.Disable()
kmyQuest.NightMotherActivator.Enable()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DBScript.pFirstSceneOver = 1
Alias_CiceroAlias.GetReference().Moveto (kmyQuest.DB07CiceroSitMarker)
Alias_ArnbjornAlias.GetReference().Moveto (kmyQuest.ArnbjornDawnstarMarker)
Alias_ArnbjornAlias.GetReference().Disable()
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(15, 1)
Alias_JournalAlias.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
;DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.DawnstarDoorPass = 1


Alias_ShadowmereAlias.GetReference().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.DawnstarDoorPass = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted (60)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;SetObjectiveCompleted (17)
SetObjectiveCompleted (15)
SetObjectiveDisplayed(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
Alias_AstridAlias.GetReference().Moveto (pAstridSceneMarker)
Alias_VeezaraAlias.GetReference().Moveto (pVeezaraSceneMarker)
Alias_NazirAlias.GetReference().Moveto (pNazirSceneMarker)
Alias_FestusAlias.GetReference().Moveto (pFestusSceneMarker)
Alias_BabetteAlias.GetReference().Moveto (pBabetteSceneMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (25)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(40, 1)
Alias_CiceroAlias.GetActorReference().GetActorBase().SetEssential (false)
VeezaraWoundedFurniture.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveCompleted (15)
SetObjectiveDisplayed(17, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif

SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DB07Script
Quest __temp = self as Quest
DB07Script kmyQuest = __temp as DB07Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (19)
;SetObjectiveDisplayed(20, 1)
SetObjectiveDisplayed(666, 1)
Alias_ArnbjornAlias.GetReference().Enable()
Alias_CiceroAlias.GetReference().Enable()
Alias_CiceroAlias.GetActorReference().RemoveFromFaction(DarkBrotherhoodFaction)
Blood.Enable()
Alias_CiceroAlias.GetReference().Moveto (kmyQuest.DB07CiceroSitMarker)
Alias_ArnbjornAlias.GetReference().Moveto (kmyQuest.ArnbjornDawnstarMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Book Property pCiceroJournal  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pBabetteSceneMarker  Auto  
ObjectReference Property pAstridSceneMarker  Auto  
ObjectReference Property pVeezaraSceneMarker  Auto  
ObjectReference Property pFestusSceneMarker  Auto 
ObjectReference Property pNazirSceneMarker  Auto  


Quest Property pSanctuaryDialogue  Auto  


Quest Property DB06  Auto  

ObjectReference Property CiceroJournal1  Auto  
ObjectReference Property CiceroJournal2  Auto 
ObjectReference Property CiceroJournal3  Auto 
ObjectReference Property CiceroJournal4  Auto    

Quest Property DB05  Auto  

Quest Property pDBEntranceQuest  Auto  

Faction Property DarkBrotherhoodFaction  Auto  

ObjectReference Property Blood  Auto  

ObjectReference Property VeezaraWoundedFurniture  Auto  
