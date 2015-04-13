;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname QF_DB08_0001EA57 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PapersBarrelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PapersBarrelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightgateDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NightgateDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AntonViraneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AntonViraneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestusKrexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestusKrexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IndoorHidingPlace5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IndoorHidingPlace5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalagogGroNolobAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalagogGroNolobAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PapersAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PapersAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IndoorHidingPlace2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IndoorHidingPlace2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IndoorHidingPlace3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IndoorHidingPlace3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IndoorHidingPlace4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IndoorHidingPlace4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutdoorHidingPlace1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OutdoorHidingPlace1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
DawnstarGuardian01.Disable()
DawnstarGuardian02.Disable()
DawnstarGuardian03.Disable()
DawnstarGuardian04.Disable()
DawnstarGuardian05.Disable()
DawnstarGuardian06.Disable()
DawnstarGuardian07.Disable()
DawnstarGuardian08.Disable()
DawnstarGuardian09.Disable()
DawnstarGuardian10.Disable()
DawnstarGuardian11.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted (30)
Utility.Wait(5)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted (2)
SetObjectiveDisplayed(4)
Game.GetPlayer().AddItem(pCookbook,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted (4)
SetObjectiveDisplayed(6)
Alias_antonViraneAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_BalagogGroNolobAlias.GetActorReference().GetActorBase().SetEssential (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
DB05Script pScript = DB05 as DB05Script
pScript.VeezaraGreet = 2
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE pDB08Script
Quest __temp = self as Quest
pDB08Script kmyQuest = __temp as pDB08Script
;END AUTOCAST
;BEGIN CODE
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
DBScript.MoreSides = 3
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet=2
DBScript.pFirstSceneOver = 1
DB07Script Script =  kmyQuest.DB07 as DB07Script
Script.CiceroThreatened = 1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted (6)
SetObjectiveDisplayed(10)

Alias_BalagogGroNolobAlias.GetActorReference().GetActorBase().SetEssential (false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE pDB08Script
Quest __temp = self as Quest
pDB08Script kmyQuest = __temp as pDB08Script
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
kmyQuest.DB07.SetStage (60)
;DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.CiceroArrive = 3
;DBScript.MoreSides = 3
;DBScript.ContractSet = 4
;DBScript.NextSet = 1
;DBScript.FirstSet=2
;DB07Script Script =  kmyQuest.DB07 as DB07Script
;Script.CiceroThreatened = 1
;KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveDisplayed(2)
DarkSanctuaryDialogueScript SanctuaryScript = pSanctuaryDialogue as DarkSanctuaryDialogueScript
SanctuaryScript.FestusFirstGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pSanctuaryDialogue  Auto  

Quest Property DB05  Auto  

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

ObjectReference Property DawnstarGuardian01  Auto  
ObjectReference Property DawnstarGuardian02  Auto  
ObjectReference Property DawnstarGuardian03  Auto  
ObjectReference Property DawnstarGuardian04  Auto  
ObjectReference Property DawnstarGuardian05  Auto  
ObjectReference Property DawnstarGuardian06  Auto  
ObjectReference Property DawnstarGuardian07  Auto  
ObjectReference Property DawnstarGuardian08  Auto  
ObjectReference Property DawnstarGuardian09  Auto  
ObjectReference Property DawnstarGuardian10  Auto  
ObjectReference Property DawnstarGuardian11  Auto  


book Property pCookbook  Auto  
