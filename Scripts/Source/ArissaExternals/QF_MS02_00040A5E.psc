;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 91
Scriptname QF_MS02_00040A5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Madanach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Madanach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urzoga
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Urzoga Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Borkul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Borkul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Grisvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Grisvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odvan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Odvan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nepos
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nepos Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Uraccen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Uraccen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Duach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Duach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EscapeTunnelDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EscapeTunnelDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoortoTunnel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoortoTunnel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Braig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Braig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BorkulKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BorkulKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MadanachDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MadanachDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS02MadanachNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS02MadanachNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thonar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthRuinsDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthRuinsDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Player is arrested
pCrimeReachFaction.SendPlayerToJail()

;Disable player bed and ore
Alias_PlayerBed.GetRef().Disable()
SilverOre.Disable()

;Thonar is no longer Essential
Alias_Thonar.GetActorRef().GetActorBase().SetEssential(False)

; PATCH1_4: make sure Guard Ambush quest is finished
MS01GuardAmbushQuest.SetStage(100)

;wait a few seconds so the quest appears after the fadein
Utility.Wait(3)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
;Player knows about Borkul
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
;Madanach asks the player to talk to Graig
SetObjectiveCompleted(25, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;Door to Madanach's area is open
If (GetStageDone(200) == 0)
  SetObjectiveCompleted(10, 1)
  SetObjectiveCompleted(20, 1)
  SetObjectiveDisplayed(25 ,1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;Madanach ravages Markarth ending
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(70, 1)
;CrimeFactionReach.SetCrimeGold(0)
;CrimeFactionReach.SetCrimeGoldViolent(0)
Game.ClearPrison()
;Player is now friendly to the Forsworn in Druadach Redoubt
Game.GetPlayer().AddtoFaction(DruadachRedoubtFaction)
;Enable ore vein so player can serve time in jail again
SilverOre.Enable()
;Enable player bed
Alias_PlayerBed.GetRef().enable()
MS02FIN.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;Madanach goes to the escape tunnel
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

pEscapeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
; Player is inside tunnel
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
;Forsworn are dead ending
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(220, 1)
;CrimeFactionReach.SetCrimeGold(0)
;CrimeFactionReach.SetCrimeGoldViolent(0)
Game.ClearPrison()
;Enable ore vein so player can serve time in jail again
SilverOre.Enable()
Alias_Thonar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
MS02FIN.Start()

;Enable player bed
Alias_PlayerBed.GetRef().enable()
;kill all the Cidhna Mine prisoners
Alias_Borkul.GetActorRef().Kill()
Alias_Braig.GetActorRef().Kill()
Alias_Odvan.GetActorRef().Kill()
Alias_Duach.GetActorRef().Kill()
Alias_Uraccen.GetActorRef().Kill()
Alias_Grisvar.GetActorRef().Kill()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Bokrul opens the door to Madanach's area
Game.GetPlayer().AddItem(MS02BorkulKey)
Alias_MadanachDoor.GetRef().Lock(False)
;MS02BorkulOpenDoor.Start()
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
;Player picks up Madanach's note
SetObjectiveCompleted(200, 1)
SetObjectiveDisplayed(210, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;TESTING ONLY
DialogueCrimeGuards.SetupCidhnaMine()
MS01.SetStage(90)
MS01.SetStage(100)
CrimeFactionReach.ModCrimeGold(3000, True)
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;Player hostile to Madanach, all prisoners are enemies of the player
Game.GetPlayer().AddtoFaction(MS02CidhnaMineEnemyFaction)

SetObjectiveFailed(10, 1)
SetObjectiveFailed(20, 1)
SetObjectiveFailed(25, 1)
SetObjectiveFailed(30, 1)
SetObjectiveFailed(40, 1)
SetObjectiveFailed(50, 1)
SetObjectiveFailed(60, 1)
SetObjectiveFailed(70, 1)
SetObjectiveDisplayed(150, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Player is told to kill Grisvar
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

;Check if Grisvar is already dead
If (Alias_Grisvar.GetActorRef().IsDead() == 1)
  SetStage(60)
EndIf

;Remove Grisvar from the Crime Faction
Alias_Grisvar.GetActorRef().RemoveFromFaction(CrimeFactionCidhnaMine)
Alias_Grisvar.GetActorRef().RemoveFromFaction(TownCidhnaMinePrisonerFaction)
Alias_Grisvar.GetActorRef().SetCrimeFaction(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
;Player has heard Braig's tale
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
;Player has killed Grisvar
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN CODE
;Tunnel is open
Alias_EscapeTunnelDoor.GetRef().Lock(False)
Alias_DoortoTunnel.GetRef().Lock(False)

;Madanach enters tunnel
Alias_Madanach.GetActorREF().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
;Player reads Madanach's note
SetObjectiveCompleted(210, 1)
SetObjectiveDisplayed(220, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
;Madanach is dead, player is told to loot Madanach's body
Alias_Madanach.GetActorRef().AddItem(MS02MadanachKey, 1)
SetObjectiveCompleted(150, 1)
SetObjectiveDisplayed(200, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_84
Function Fragment_84()
;BEGIN CODE
;Madanach forcegreets

;Tunnel is open
Alias_EscapeTunnelDoor.GetRef().Lock(False)
Alias_DoortoTunnel.GetRef().Lock(False)

;Everyone runs to the tunnel
Alias_Borkul.GetActorRef().EvaluatePackage()
Alias_Odvan.GetActorRef().EvaluatePackage()
Alias_Uraccen.GetActorRef().EvaluatePackage()
Alias_Duach.GetActorRef().EvaluatePackage()
Alias_Braig.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_82
Function Fragment_82()
;BEGIN CODE
;Grisvar flees
Alias_Grisvar.GetActorRef().AddtoFaction(MS02GrisvarEnemyFaction)
Alias_Grisvar.GetActorRef().SetAv("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property Shiv  Auto  

Faction Property ForswornAttack  Auto  

Armor Property SilverFishRing  Auto  

Faction Property pCrimeReachFaction  Auto  

ActorBase Property pNeposActorBase  Auto  

Quest Property MS01  Auto  

Potion Property pSkooma  Auto  

Faction Property pCidhnaMineCombatFaction  Auto  

Scene Property pEscapeScene  Auto  

Faction Property pCidhnaMineFaction  Auto  

CrimeGuardsScript Property DialogueCrimeGuards  Auto  

Faction Property CrimeFactionReach  Auto  

Scene Property MS02BorkulOpenDoor  Auto  

Faction Property CidhnaMineCrimeFaction  Auto  

Faction Property CrimeFactionCidhnaMine  Auto  

Scene Property MS02GrisvarScene  Auto  

Faction Property MS02CidhnaMineEnemyFaction  Auto  

Quest Property MS02FIN  Auto  

Faction Property DruadachRedoubtFaction  Auto  

Key Property MS02BorkulKey  Auto  

Faction Property MS02GrisvarEnemyFaction  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Faction Property TownCidhnaMinePrisonerFaction  Auto  

Key Property MS02MadanachKey  Auto  

ObjectReference Property SilverOre  Auto  

Quest Property MS01GuardAmbushQuest  Auto  
