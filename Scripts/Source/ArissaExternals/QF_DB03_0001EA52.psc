;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 41
Scriptname QF_DB03_0001EA52 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AlainDufontAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_AlainDufontAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MuiriAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_MuiriAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NilsineAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_NilsineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroRoadAlias
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_CiceroRoadAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
;Sanctuary Setup Failsafe
DBSanc_CiceroMovesIn_Enable.Enable()
DBSanc_CiceroMovesIn_Disable.Disable()
DBSanc_CiceroCleansUp_Enable.Enable()
DBSanc_CiceroCleansUp_Disable.Disable()
DBSanc_NMMovesIn_Enable.Enable()
DBSanc_NMMovesIn_Disable.Disable()
DBSanc_NMCleansUp_Enable.Enable()
DBSanc_NMCleansUp_Disable.Disable()
pDB04.SetStage(1)

SetObjectiveCompleted (50)
Utility.Wait(5)
Stop()
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
CiceroJournal1.Enable()
CiceroJournal2.Enable()
CiceroJournal3.Enable()
CiceroJournal4.Enable()
Alias_AlainDufontAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(25, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
Alias_MuiriAlias.GetActorReference().GetActorBase().SetEssential (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveCompleted(5)
Endif

SetObjectiveDisplayed(10, 1)
pCiceroEndArriveScene.Start()
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

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(40, 1)

;kmyQuest.DBNightMotherCoffinRef.Disable()
;kmyQuest.NightMotherCoffin.Enable()
;kmyQuest.NightMotherActivator.Enable()
;kmyQuest.NMCoffin.Enable()
;NMBodyChamberRef.Enable()

;Sanctuary Setup
;DBSanc_CiceroMovesIn_Enable.Enable()
;DBSanc_CiceroMovesIn_Disable.Disable()
;DBSanc_CiceroCleansUp_Enable.Enable()
;DBSanc_CiceroCleansUp_Disable.Disable()
;DBSanc_NMMovesIn_Enable.Enable()
;DBSanc_NMMovesIn_Disable.Disable()
;DBSanc_NMCleansUp_Enable.Enable()
;DBSanc_NMCleansUp_Disable.Disable()
;pDB04.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DBNightMotherCoffinRef.Disable()
kmyQuest.NightMotherCoffin.Enable()
kmyQuest.NightMotherActivator.Enable()
kmyQuest.NMCoffin.Enable()
NMBodyChamberRef.Enable()

;Sanctuary Setup
DBSanc_CiceroMovesIn_Enable.Enable()
DBSanc_CiceroMovesIn_Disable.Disable()
DBSanc_CiceroCleansUp_Enable.Enable()
DBSanc_CiceroCleansUp_Disable.Disable()
DBSanc_NMMovesIn_Enable.Enable()
DBSanc_NMMovesIn_Disable.Disable()
DBSanc_NMCleansUp_Enable.Enable()
DBSanc_NMCleansUp_Disable.Disable()
pDB04.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed (40)
      SetObjectiveCompleted (40)
endif

if IsObjectiveDisplayed (30)
      SetObjectiveDisplayed (30,0)
endif

if IsObjectiveDisplayed (10)
      SetObjectiveCompleted (10)
endif


SetObjectiveDisplayed(50, 1)
Alias_CiceroAlias.GetReference().Moveto (pCiceroRoomMarker)
CiceroRoadAlias.GetReference().Disable()

;Debug.MessageBox("I am stage 50 getting called on DB03.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB02.SetStage (200)
pDB02a.SetStage (200)
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FirstKill = 1
DBScript.pFirstSceneOver = 1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Alias_AlainDufontAlias.GetActorRef().Moveto (pAlainPitMarker) 
;Game.GetPlayer().Moveto (pPlayerPitMarker) 
;DB03Script pScript = pDB03 as DB03Script
;pScript.AlainPitPosition = 1
;Alias_AlainDufontAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DB03Script
Quest __temp = self as Quest
DB03Script kmyQuest = __temp as DB03Script
;END AUTOCAST
;BEGIN CODE
;SetObjectiveCompleted (25)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

ObjectReference Property pPlayerPitMarker  Auto  

ObjectReference Property pAlainPitMarker  Auto  

Quest Property pDB03  Auto  


ObjectReference Property pCiceroRoomMarker  Auto  

ReferenceAlias Property CiceroRoadAlias  Auto  

Quest Property pSanctuaryDialogue  Auto  

ObjectReference Property DBSanc_CiceroMovesIn_Enable Auto  
ObjectReference Property DBSanc_CiceroMovesIn_Disable Auto  

ObjectReference Property DBSanc_CiceroCleansUp_Enable Auto  
ObjectReference Property DBSanc_CiceroCleansUp_Disable Auto  

ObjectReference Property DBSanc_NMMovesIn_Enable Auto  
ObjectReference Property DBSanc_NMMovesIn_Disable Auto  

ObjectReference Property DBSanc_NMCleansUp_Enable Auto  
ObjectReference Property DBSanc_NMCleansUp_Disable Auto  

ObjectReference Property CiceroJournal1  Auto  
ObjectReference Property CiceroJournal2  Auto 
ObjectReference Property CiceroJournal3  Auto 
ObjectReference Property CiceroJournal4  Auto    

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

Quest Property pDB02a  Auto  

Scene Property pCiceroEndArriveScene  Auto  

Quest Property pDB04  Auto  

ObjectReference Property NMBodyChamberRef  Auto  
