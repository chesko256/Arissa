;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname QF_DB04_0001EA53 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeadAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeadAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RexusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RexusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArnbjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoffinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoffinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB04PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB04PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmaundMotierreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmaundMotierreAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
DarkSanctuaryDialogueScript SanctuaryScript = pSanctuaryDialogue as DarkSanctuaryDialogueScript
SanctuaryScript.CiceroFirstGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Close and lock Astrid's door. Called from DB03 Stage
DBSanc_NotAstridDoor.Disable()
DBSanc_AstridDoor.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
;Calling Stage 40 to update the Sanctuary state.
kmyQuest.DB03.SetStage (40)
kmyQuest.DB03.SetStage (50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(30, 1)
Alias_AstridAlias.GetReference().Moveto (pAstridWaitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (40)
SetObjectiveDisplayed(50, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
Alias_CiceroAlias.GetReference().Moveto (pCiceroRoomMarker)
CiceroJournal1.Enable()
CiceroJournal2.Enable()
CiceroJournal3.Enable()
CiceroJournal4.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
;Alias_PlayerAlias.GetReference().Moveto(Alias_AstridAlias.GetReference())
kmyQuest.NightMotherCoffin.Enable()
kmyQuest.NightMotherNPCRef.Enable()
kmyQuest.NMCoffin.Enable()
NMBodyChamberRef.Enable()
kmyQuest.DBNightMotherCoffin.Disable()
Alias_CiceroAlias.GetReference().Enable()
kmyQuest.NightMotherActivatorRef.Enable()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.ContractSet = 3
DBScript.FirstSet = 2
DBScript.pFirstSceneOver = 1
;kmyQuest.DB03.SetStage (50)
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted (50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DB04Script
Quest __temp = self as Quest
DB04Script kmyQuest = __temp as DB04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(40, 1)
DB04a.Start()
Alias_AmaundMotierreAlias.GetReference().Enable()
Alias_RexusAlias.GetReference().Enable()
Game.EnablePlayerControls()
pChamberDoor.Lock (false)
AstridDoor.Lock (false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

ObjectReference Property pCiceroRoomMarker  Auto  

ObjectReference Property pAstridWaitMarker  Auto  

Quest Property DB04a  Auto  

Quest Property pSanctuaryDialogue  Auto  

ObjectReference Property CiceroJournal1  Auto  
ObjectReference Property CiceroJournal2  Auto 
ObjectReference Property CiceroJournal3  Auto 
ObjectReference Property CiceroJournal4  Auto    

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

ObjectReference Property DBSanc_AstridDoor  Auto  

ObjectReference Property DBSanc_NotAstridDoor  Auto  

ObjectReference Property pChamberDoor  Auto  

ObjectReference Property AstridDoor  Auto  

ObjectReference Property NMBodyChamberRef  Auto  
