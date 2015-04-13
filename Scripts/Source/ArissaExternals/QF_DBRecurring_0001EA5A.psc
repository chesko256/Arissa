;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_DBRecurring_0001EA5A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Contact1Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target10Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target10Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target6Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target6Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target7Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target7Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target4Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target4Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact3Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target5Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target5Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact2Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target3Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target1Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target8Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target8Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact4Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact4Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target2Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact10Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact10Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact6Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact6Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact5Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact5Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact8Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact8Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact9Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact9Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contact7Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Contact7Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target9Alias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target9Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NMCoffinAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NMCoffinAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
ContactFaction1.SetPlayerEnemy(False)
ContactFaction2.SetPlayerEnemy(False)
ContactFaction3.SetPlayerEnemy(False)
ContactFaction4.SetPlayerEnemy(False)
ContactFaction5.SetPlayerEnemy(False)
ContactFaction6.SetPlayerEnemy(False)
ContactFaction7.SetPlayerEnemy(False)
ContactFaction8.SetPlayerEnemy(False)
ContactFaction9.SetPlayerEnemy(False)
ContactFaction10.SetPlayerEnemy(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DBRecurringQuestScript
Quest __temp = self as Quest
DBRecurringQuestScript kmyQuest = __temp as DBRecurringQuestScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.DB07.SetStage (200)
;kmyQuest.DB08.SetStage (200)
;kmyQuest.DB09.SetStage (200)
;kmyQuest.DB10.SetStage (200)
kmyQuest.DB11.SetStage (80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DBRecurringQuestScript
Quest __temp = self as Quest
DBRecurringQuestScript kmyQuest = __temp as DBRecurringQuestScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.DB01.SetStage (200)
;kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
;kmyQuest.DB04.SetStage (200)
;kmyQuest.DB04a.SetStage (200)
;kmyQuest.DB05.SetStage (200)
;kmyQuest.DB06.SetStage (200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DBRecurringQuestScript
Quest __temp = self as Quest
DBRecurringQuestScript kmyQuest = __temp as DBRecurringQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_NightMotherAlias.GetReference().Moveto (NightMotherDawnstarMarker)
DarkSanctuaryDialogueScript SanctuaryScript = pSanctuaryDialogue as DarkSanctuaryDialogueScript
SanctuaryScript.NazirFirstGreet = 1
SanctuaryScript.BabetteFirstGreet = 1
DawnstarEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
TargetFaction1.SetPlayerEnemy(False)
TargetFaction2.SetPlayerEnemy(False)
TargetFaction3.SetPlayerEnemy(False)
TargetFaction4.SetPlayerEnemy(False)
TargetFaction5.SetPlayerEnemy(False)
TargetFaction6.SetPlayerEnemy(False)
TargetFaction7.SetPlayerEnemy(False)
TargetFaction8.SetPlayerEnemy(False)
TargetFaction9.SetPlayerEnemy(False)
TargetFaction10.SetPlayerEnemy(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed(20, 1)
Alias_Target1Alias.GetReference().Disable()
Alias_Target2Alias.GetReference().Disable()
Alias_Target3Alias.GetReference().Disable()
Alias_Target4Alias.GetReference().Disable()
Alias_Target5Alias.GetReference().Disable()
Alias_Target6Alias.GetReference().Disable()
Alias_Target7Alias.GetReference().Disable()
Alias_Target8Alias.GetReference().Disable()
Alias_Target9Alias.GetReference().Disable()
Alias_Target10Alias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
pDawnstarDoor1.Enable()
pDawnstarDoor2.Disable()
Coffin.Enable()
Corpse.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted (30)
Alias_Contact1Alias.GetReference().Disable()
Alias_Contact2Alias.GetReference().Disable()
Alias_Contact3Alias.GetReference().Disable()
Alias_Contact4Alias.GetReference().Disable()
Alias_Contact5Alias.GetReference().Disable()
Alias_Contact6Alias.GetReference().Disable()
Alias_Contact7Alias.GetReference().Disable()
Alias_Contact8Alias.GetReference().Disable()
Alias_Contact9Alias.GetReference().Disable()
Alias_Contact10Alias.GetReference().Disable()
DBRecurringControlQuest.SetStage (10)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE DBRecurringQuestScript
Quest __temp = self as Quest
DBRecurringQuestScript kmyQuest = __temp as DBRecurringQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
DBrecurringQuestScript Script = kmyQuest.DBRecurring as DBrecurringQuestScript
Script.Contact = 0
Script.Target = 0
;DBRecurringControlQuest.SetStage(200)
if NightmotherDawnstarTrigger.IsPlayerInTrigger()
	pNightMotherRecurringScene1.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DBRecurringQuestScript
Quest __temp = self as Quest
DBRecurringQuestScript kmyQuest = __temp as DBRecurringQuestScript
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property pContractStage  Auto Conditional 

ObjectReference Property NightMotherDawnstarMarker  Auto  

Quest Property pSanctuaryDialogue  Auto  

Quest Property DBRecurringControlQuest  Auto  

ObjectReference Property DawnstarEnableMarker  Auto  

Quest Property DB05  Auto  

ObjectReference Property pDawnstarDoor1  Auto  

ObjectReference Property pDawnstarDoor2  Auto  

pNightMotherDawnstarTriggerScript Property NightMotherDawnstarTrigger  Auto  

Scene Property pNightMotherRecurringScene1  Auto  

Faction Property TargetFaction1  Auto  

Faction Property TargetFaction2  Auto  

Faction Property TargetFaction3  Auto  

Faction Property TargetFaction4  Auto  

Faction Property TargetFaction5  Auto  

Faction Property TargetFaction6  Auto  

Faction Property TargetFaction7  Auto  

Faction Property TargetFaction8  Auto  

Faction Property TargetFaction9  Auto  

Faction Property TargetFaction10  Auto  

Faction Property ContactFaction1  Auto  

Faction Property ContactFaction2  Auto  

Faction Property ContactFaction3  Auto  

Faction Property ContactFaction4  Auto  

Faction Property ContactFaction5  Auto  

Faction Property ContactFaction6  Auto  

Faction Property ContactFaction7  Auto  

Faction Property ContactFaction8  Auto  

Faction Property ContactFaction9  Auto  

Faction Property ContactFaction10  Auto  

ObjectReference Property Coffin  Auto  

ObjectReference Property Corpse  Auto  
