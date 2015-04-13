;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname QF_DB05_0001EA54 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VivienneOnisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VivienneOnisAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmaundMotierreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmaundMotierreAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ring2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ring2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrylingAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrylingAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VulwulfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VulwulfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PanteaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PanteaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VeezaraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VeezaraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StatueAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatueAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElisifAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ElisifAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RorlundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RorlundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NosterAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NosterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KaydAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KaydAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PorlofAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PorlofAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ErikurAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ErikurAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VittoriaViciAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VittoriaViciAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StatueEnableMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatueEnableMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PenitusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PenitusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AsgeirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AsgeirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlexiaViciAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlexiaViciAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ring1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ring1Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
Alias_VivienneOnisAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerVivienne)
Alias_KaydAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerKayd)
Alias_NosterAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerNoster)
Alias_ElisifAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerJarl)
Alias_RorlundAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerRorlund)
Alias_PanteaAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerPantea)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
DarkSanctuaryDialogueScript SanctuaryScript = pDarkSanctuaryDialogue as DarkSanctuaryDialogueScript
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

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
Alias_PenitusAlias.GetReference().Enable()
Alias_LodiAlias.GetReference().Enable()
Alias_PanteaAlias.GetActorRef().AddToFaction(BardNoRequestFaction)
(BardSongs as BardSongsScript).Bard2PlaySong(alias_Lodialias.GetActorRef(),"Flute")
Actor Asgeir = Alias_AsgeirAlias.GetReference() as Actor
Asgeir.SetCrimeFaction(CrimeFactionHaafingar)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
Alias_VeezaraAlias.GetReference().Moveto (kmyQuest.VeezaraReturnMarker)
SetObjectiveCompleted (20)
Game.AddAchievement(19)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
Alias_VulwulfAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerVulwulf)
Alias_PorlofAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerPorlof)
Alias_AlexiaViciAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerAlexia)
DB05StuffMarker.Enable()
Alias_VittoriaViciAlias.GetActorReference().SetOutfit (WeddingOutfit)
(Alias_StatueAlias.GetReference() As DB05FallingStatueActivate).GoToState("Waiting")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
;Alias_VeezaraAlias.GetReference().Moveto (kmyQuest.pWeddingMarkerVeezara)
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20, 1)
DaggerDragonBridge.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
Alias_BrylingAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_ErikurAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_LodiAlias.GetReference().Disable()
Alias_AlexiaViciAlias.GetReference().Disable()
Alias_PanteaAlias.GetActorRef().RemoveFromFaction(BardNoRequestFaction)
Actor Asgeir = Alias_AsgeirAlias.GetReference() as Actor
Asgeir.SetCrimeFaction(CrimeFactionRift)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().Moveto(Alias_AstridAlias.GetReference())
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
kmyQuest.DB03.SetStage (200)
kmyQuest.DB04.SetStage (200)
kmyQuest.DB04a.SetStage (40)
kmyQuest.NightMotherCoffinChamber.Enable()
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
Alias_AmaundMotierreAlias.GetReference().Enable()
;DB04Script pDB04Script = pDB04 as DB04Script
;pDB04Script.Side = 3
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB05Script
Quest __temp = self as Quest
DB05Script kmyQuest = __temp as DB05Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
Alias_VittoriaViciAlias.GetReference().Moveto (kmyQuest.VittoriaWeddingMarker)
Alias_AsgeirAlias.GetReference().Moveto (kmyQuest.AsgeirWeddingMarker)
Alias_VittoriaViciAlias.GetActorReference().GetActorBase().SetEssential (false) 
Alias_AsgeirAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_AlexiaViciAlias.GetReference().Enable()
Alias_StatueEnableMarkerAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
CiceroJournal1.Enable()
CiceroJournal2.Enable()
CiceroJournal3.Enable()
CiceroJournal4.Enable()
Game.GetPlayer().AddToFaction(DarkBrotherhoodFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Quest Property pDarkSanctuaryDialogue  Auto  

ObjectReference Property CiceroJournal1  Auto  
ObjectReference Property CiceroJournal2  Auto 
ObjectReference Property CiceroJournal3  Auto 
ObjectReference Property CiceroJournal4  Auto    

ObjectReference Property DB05StuffMarker  Auto  

Outfit Property WeddingOutfit  Auto  

Faction Property DarkBrotherhoodFaction  Auto  

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

ObjectReference Property DaggerDragonBridge  Auto  

Faction Property BardNoRequestFaction  Auto  

Quest Property BardSongs  Auto  

Faction Property CrimeFactionHaafingar  Auto  

Faction Property CrimeFactionRift  Auto  
