;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 35
Scriptname QF_DB06_0001EA55 Extends Quest Hidden

;BEGIN ALIAS PROPERTY VeezaraAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VeezaraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IncriminatingLetterAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IncriminatingLetterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CommanderMaroAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CommanderMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GabriellaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GabriellaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestusAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FestusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaroScheduleAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MaroScheduleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BabetteAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BabetteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArnbjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GaiusMaroAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GaiusMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FaidaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FaidaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
;Sanctuary Setup
DBSanc_CiceroMovesIn_Enable.Disable()
DBSanc_CiceroMovesIn_Disable.Enable()
DBSanc_CiceroMovesOut_Enable.Enable()
DBSanc_CiceroMovesOut_Disable.Disable()

SetObjectiveCompleted (30)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
DB05Script pScript = DB05 as DB05Script
pScript.Bonus = 1
pScript.VeezaraGreet = 2
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
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

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
Alias_AstridAlias.GetReference().Moveto (pAstridSceneMarker)
Alias_VeezaraAlias.GetReference().Moveto (pVeezaraSceneMarker)
Alias_NazirAlias.GetReference().Moveto (pNazirSceneMarker)
Alias_FestusAlias.GetReference().Moveto (pFestusSceneMarker)
Alias_BabetteAlias.GetReference().Moveto (pBabetteSceneMarker)

Alias_GaiusMaroAlias.GetReference().Disable()
VeezaraBlood.Enable()
VeezaraWoundedFurniture.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
Alias_CiceroAlias.GetReference().Moveto (kmyQuest.DB07CiceroSitMarker)
Alias_CiceroAlias.GetReference().Disable()
Alias_ArnbjornAlias.GetReference().Moveto (kmyQuest.ArnbjornDawnstarMarker)
Alias_ArnbjornAlias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (5)
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(8)
Alias_MaroScheduleAlias.GetReference().Enable()
Alias_CommanderMaroAlias.GetReference().Enable()
Alias_GaiusMaroAlias.GetReference().Enable()
Alias_FaidaAlias.GetReference().Moveto (pFaidaStandMarker)
Alias_CommanderMaroAlias.GetReference().Moveto (pCommanderMaroStandMarker)
Alias_GaiusMaroAlias.GetReference().Moveto (pGaiusStandMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().Moveto(Alias_AstridAlias.GetReference())
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (200)
kmyQuest.DB05.SetStage (20)
kmyQuest.NightMotherCoffin.Enable()
kmyQuest.DBNightMotherCoffin.Disable()
Alias_CiceroAlias.GetReference().Enable()
kmyQuest.NightMotherActivator.Enable()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DBScript.pFirstSceneOver = 1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB06Script
Quest __temp = self as Quest
DB06Script kmyQuest = __temp as DB06Script
;END AUTOCAST
;BEGIN CODE
;SetObjectiveDisplayed(30, 1)
Alias_GabriellaAlias.GetReference().Moveto (pGabriellaGreetMarker)

;Sanctuary Setup
DBSanc_CiceroMovesIn_Enable.Disable()
DBSanc_CiceroMovesIn_Disable.Enable()
DBSanc_CiceroMovesOut_Enable.Enable()
DBSanc_CiceroMovesOut_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveDisplayed(5)
DarkSanctuaryDialogueScript SanctuaryScript = pSanctuaryDialogue as DarkSanctuaryDialogueScript
SanctuaryScript.GabriellaFirstGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

ObjectReference Property pGaiusStandMarker  Auto  

ObjectReference Property pCommanderMaroStandMarker  Auto  

ObjectReference Property pFaidaStandMarker  Auto  

ObjectReference Property pGabriellaGreetMarker  Auto  

ObjectReference Property pBabetteSceneMarker  Auto  
ObjectReference Property pAstridSceneMarker  Auto  
ObjectReference Property pVeezaraSceneMarker  Auto  
ObjectReference Property pFestusSceneMarker  Auto 
ObjectReference Property pNazirSceneMarker  Auto  

Quest Property pSanctuaryDialogue  Auto  


Quest Property DB06  Auto  

ObjectReference Property DBSanc_CiceroMovesOut_Enable Auto  
ObjectReference Property DBSanc_CiceroMovesOut_Disable Auto  

ObjectReference Property DBSanc_CiceroMovesIn_Enable Auto  
ObjectReference Property DBSanc_CiceroMovesIn_Disable Auto  

ObjectReference Property CiceroJournal1  Auto  
ObjectReference Property CiceroJournal2  Auto 
ObjectReference Property CiceroJournal3  Auto 
ObjectReference Property CiceroJournal4  Auto    

Quest Property DB05  Auto  

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

ObjectReference Property VeezaraBlood  Auto  

ObjectReference Property VeezaraWoundedFurniture  Auto  
