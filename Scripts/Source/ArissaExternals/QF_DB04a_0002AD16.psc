;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname QF_DB04a_0002AD16 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmuletAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmuletAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DelvinMalloryAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DelvinMalloryAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreditAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CreditAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArnbjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NightMotherAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NightMotherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LetterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RexusAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RexusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmaundMotierreAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmaundMotierreAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
game.GetPlayer().AddItem(Alias_LetterAlias.GetReference())
game.GetPlayer().AddItem(Alias_AmuletAlias.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB04aScript
Quest __temp = self as Quest
DB04aScript kmyQuest = __temp as DB04aScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveCompleted(5)
Endif

if DB04a.GetStage () == 10
SetObjectiveDisplayed(10, 1)
endif

if DB04a.GetStage () == 15
SetObjectiveDisplayed(10, 1)
endif

if DB04a.GetStage () == 20
SetObjectiveDisplayed(20, 1)
endif

DB04Script pDB04Script = pDB04 as DB04Script
pDB04Script.Side=5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
game.GetPlayer().AddItem(Alias_CreditAlias.GetReference())
game.GetPlayer().RemoveItem(Alias_AmuletAlias.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
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

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;SetObjectiveCompleted (10)
;SetObjectiveDisplayed(15)
Alias_RexusAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(40)
DaggerSolitude.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DB04aScript
Quest __temp = self as Quest
DB04aScript kmyQuest = __temp as DB04aScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (40)
Alias_AmaundMotierreAlias.GetReference().Disable()
Alias_RexusAlias.GetReference().Disable()
Game.GetPlayer().RemoveItem(pCreditLetter,1)
Utility.Wait(5)
Stop()
pDB04.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
Alias_RexusAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB04aScript
Quest __temp = self as Quest
DB04aScript kmyQuest = __temp as DB04aScript
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().Moveto(Alias_AstridAlias.GetReference())
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.NightMotherCoffinChamber.Enable()
kmyQuest.DBNightMotherCoffin.Disable()
Alias_CiceroAlias.GetReference().Enable()
kmyQuest.NightMotherActivator.Enable()
DB04Script DB04s = kmyQuest.DB04 as DB04Script
DB04s.Side = 4
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.ContractSet = 4
DBScript.NextSet = 1
DBScript.FirstSet = 2
DBScript.CiceroArrive = 3
DBScript.pFirstSceneOver = 1
Alias_AmaundMotierreAlias.GetReference().Enable()
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DB04aScript
Quest __temp = self as Quest
DB04aScript kmyQuest = __temp as DB04aScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(10)
       SetObjectiveCompleted (10)
       SetObjectiveDisplayed(20, 1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveDisplayed(5, 1)
DaggerVolunruud.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pSanctuaryDialogue  Auto  

Quest Property pDB04  Auto  

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

Book Property pCreditLetter  Auto  

ObjectReference Property DaggerVolunruud  Auto  

ObjectReference Property DaggerSolitude  Auto  

quest Property DB04a  Auto  
