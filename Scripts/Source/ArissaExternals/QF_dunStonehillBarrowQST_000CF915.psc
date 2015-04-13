;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 47
Scriptname QF_dunStonehillBarrowQST_000CF915 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BridgeBandit2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BridgeBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LowerBanditEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LowerBanditEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningHallBandit2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DiningHallBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kyr
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgeLever
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BridgeLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StoreroomBandit1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StoreroomBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KyrJournal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_KyrJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pursuer3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Pursuer3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PursuerEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PursuerEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EisaJournal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EisaJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TunnelsBandit1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TunnelsBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eisa
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Eisa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PaleBlade
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PaleBlade Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pursuer1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Pursuer1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pursuer2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Pursuer2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TunnelsBandit2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TunnelsBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RajirrSoulWitchlight
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RajirrSoulWitchlight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KyrSoulWitchlight
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_KyrSoulWitchlight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgeDownBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BridgeDownBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningHallBandit1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DiningHallBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgeBandit1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BridgeBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PaleLady
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PaleLady Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StoreroomBandit2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StoreroomBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rajirr
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Rajirr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EisaJournalFallbackSpawnPoint
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EisaJournalFallbackSpawnPoint Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostmereDepthsDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FrostmereDepthsDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player has attacked one of the bandits in the dining hall area.
Alias_DiningHallBandit1.GetActorRef().Activate(None)
Alias_DiningHallBandit2.GetActorRef().Activate(None)
Alias_BridgeBandit1.GetActorRef().Activate(None)
Alias_BridgeBandit2.GetActorRef().Activate(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player gets the objective from Eisa or her journal.
SetObjectiveDisplayed(1)
SetObjectiveDisplayed(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
if (GetStageDone(1))
   SetObjectiveCompleted(1)
   SetObjectiveCompleted(2)
   SetObjectiveDisplayed(4)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Rajiir runs for the altar.
RajiirScene.Start()

;Kill Kyr, or we're down a Wisp.
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;Eisa turns hostile.
EisaFaction.SetEnemy(PlayerFaction)
Alias_Eisa.GetActorRef().StartCombat(Game.GetPlayer())
Utility.Wait(0.5)
Alias_Eisa.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Player reads Eisa's journal. Clear the objective flag on it.

;If the player didn't get the quest from Eisa, and is still outside, they get it now.
if (!GetStageDone(1) && !GetStageDone(20))
   SetStage(1)
EndIf

;If the player has read Kyr's journal too, complete the optional objective.
if (GetStageDone(4))
     SetObjectiveCompleted(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Start the Dining Hall scene.
DiningHallScene.Start()

;Disable bridge bandit if we can to avoid awkwardness.
if (!Game.GetPlayer().HasLoS(Alias_BridgeBandit1.GetActorRef()))
     Alias_BridgeBandit1.GetActorRef().Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
(Alias_Kyr as dunSetRestrainedWhenSeated).SetRestrained(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;All pursuers dead. Trigger Eisa's forcegreet.
Alias_Eisa.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Eisa flees.
Alias_PursuerEnableMarker.GetReference().Enable()
Alias_Pursuer1.GetActorRef().DamageAV("Health", (Alias_Pursuer1.GetActorRef().GetAV("Health") - 1))
Alias_Pursuer2.GetActorRef().DamageAV("Health", (Alias_Pursuer2.GetActorRef().GetAV("Health") - 1))
Alias_Pursuer3.GetActorRef().DamageAV("Health", (Alias_Pursuer3.GetActorRef().GetAV("Health") - 1))
FleeScene.Start()
Alias_Eisa.GetActorRef().EvaluatePackage()
Utility.Wait(5)
PursuerScene.Start()
Alias_Eisa.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Player kills the witchlight.
RajirrFaction.SetEnemy(PlayerFaction)
PaleLadyFaction.SetEnemy(PlayerFaction)
SetObjectiveCompleted(4)

if (GetStageDone(85))
   SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Kyr dies.
if (GetStageDone(1))
   SetStage(8)
EndIf
Alias_Kyr.GetActorRef().Kill()
Utility.Wait(0.5)
Alias_KyrSoulWitchlight.GetReference().MoveTo(Alias_Kyr.GetActorRef(), 25, 25, 100)
Alias_KyrSoulWitchlight.GetReference().Enable(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;The Pale Lady manifests.
Alias_PaleLady.GetActorRef().Activate(Alias_Rajirr.GetActorRef())
Alias_Rajirr.GetActorRef().StartCombat(Alias_PaleLady.GetActorRef())
Alias_PaleLady.GetActorRef().StartCombat(Alias_Rajirr.GetActorRef())
if (GetStageDone(1))
   SetStage(9)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;If Eisa leaves peacefully, remove the journal from her and place it in her room.
Alias_Eisa.GetActorRef().RemoveItem(EisaJournalBase, 1, True)
ObjectReference journal = Alias_EisaJournalFallbackSpawnPoint.GetReference().PlaceAtMe(EisaJournal, 1)
Alias_EisaJournal.ForceRefTo(journal)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Player can no longer get the journal from Eisa, so if they don't have it, create it in her room.
if (Alias_Eisa.GetActorRef().GetItemCount(EisaJournalBase) > 0)
   ObjectReference journal = Alias_EisaJournalFallbackSpawnPoint.GetReference().PlaceAtMe(EisaJournal, 1)
   Alias_EisaJournal.ForceRefTo(journal)
EndIf

;Disable and delete Eisa when the player enters the ruins.
Alias_Eisa.GetActorRef().Disable()
Alias_Eisa.GetActorRef().Delete()

;Then start the scene with the bandits in the entryway.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Quest completed.
if (GetStageDone(1))
   CompleteAllObjectives()
   CompleteQuest()
   (AchievementsQuest as AchievementsScript).IncSideQuests()
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player dispels the witchlight by placing the sword on the altar.
RajirrFaction.SetEnemy(PlayerFaction)
PaleLadyFaction.SetEnemy(PlayerFaction)
SetObjectiveCompleted(4)
Utility.Wait(2)

if (GetStageDone(85))
   SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
if (GetStageDone(1))
   SetObjectiveCompleted(1)
   SetObjectiveCompleted(2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Eisa leaves peacefully.

;Move the journal to Eisa's room.
SetStage(2)

;Start the quest.
SetStage(1)

;Eisa heads off to Morthal.
Alias_Eisa.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Start the bridge down scene.
Alias_LowerBanditEnableMarker.GetReference().Enable()
Utility.Wait(1)
BridgeDownScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player has attacked one of the bandits in the entryway.
Alias_StoreroomBandit1.GetActorRef().Activate(None)
Alias_StoreroomBandit2.GetActorRef().Activate(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Start the tunnels scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Rajirr Dies.

;If the Pale Lady hasn't manifested by now (because Ra'jirr is dead, etc.), activate her.
SetStage(75)

RajirrFaction.SetEnemy(PlayerFaction)
PaleLadyFaction.SetEnemy(PlayerFaction)
Utility.Wait(0.5)
Alias_RajirrSoulWitchlight.GetReference().MoveTo(Alias_Rajirr.GetActorRef(), 25, 25, 100)
Alias_RajirrSoulWitchlight.GetReference().Enable(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Player acquires the Pale Blade from Rajiir's corpse. Updates objective target.
SetObjectiveCompleted(3)

if (GetStageDone(90) || GetStageDone(91))
   SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Start the Gate Closing scene.
BridgeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;Player hears mention that Ra'jirr and the boss are in the tunnels.
if (GetStageDone(1))
   SetObjectiveDisplayed(2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Player reads Kyr's journal. Clear the objective flag.

;If the player has read Eisa's journal too, complete the optional objective.
if (GetStageDone(3))
     SetObjectiveCompleted(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player has attacked one of the bandits in the gate-closing area.
Alias_BridgeBandit1.GetActorRef().Activate(None)
Alias_BridgeBandit2.GetActorRef().Activate(None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FleeScene  Auto  

Faction Property PursuerFaction  Auto  

Faction Property PlayerFaction  Auto  

Scene Property FleeScene2  Auto  

Scene Property BridgeScene  Auto  

Scene Property DiningHallScene  Auto  

Scene Property DraugrScene  Auto  

Faction Property EisaFaction  Auto  

Scene Property BridgeDownScene  Auto  

Scene Property PaleLadyAppearsScene  Auto  

Activator Property BanishFX  Auto  

Faction Property CombatantsFaction  Auto  

Scene Property CoughingScene  Auto  

Scene Property RajiirScene  Auto  

Faction Property RajirrFaction  Auto  

Book Property EisaJournal  Auto  

Scene Property PursuerScene  Auto  

Faction Property PaleLadyFaction  Auto  
Book Property EisaJournalBase  Auto  

Quest Property AchievementsQuest  Auto  
