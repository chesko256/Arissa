;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 56
Scriptname QF_DA11_0002C358 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DraugrBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DraugrBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VoiceofNamira
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VoiceofNamira Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NamiraShrineRoomTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NamiraShrineRoomTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReachcliffCave
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ReachcliffCave Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hogni
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hogni Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Glooredhel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Glooredhel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalloftheDead
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HalloftheDead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecretExit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SecretExit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReachcliffEntrance
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReachcliffEntrance Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Banning
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Banning Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalloftheDeadCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalloftheDeadCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofNamira
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineofNamira Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReachcliffCaveCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReachcliffCaveCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrotherVerulus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrotherVerulus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lisbet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lisbet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;Player is asked to kill Verulus
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

;Verulus is no longer essential
pVerulusActorBase.SetEssential(false)
pVerulusActorBase.SetProtected(True)
Alias_BrotherVerulus.GetActorRef().SetRestrained(True)
Alias_BrotherVerulus.GetActorRef().SetAV("Health", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Glooredhel will follow the player in Reachcliff
Alias_Glooredhel.GetActorRef().SetPlayerTeammate(abCanDoFavor = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Cannibals attack
Actor VerulusREF = Alias_BrotherVerulus.GetActorRef()
Actor HogniREF = Alias_Hogni.GetActorRef()
Actor LisbetREF = Alias_Lisbet.GetActorRef()
Actor BanningREF = Alias_Banning.GetActorRef()
Actor Cultist01REF = Alias_Cultist01.GetActorRef()
Actor Cultist02Ref = Alias_Cultist02.GetActorRef()

Game.GetPlayer().RemoveFromFaction(pGlooredhelAllyFaction)
Game.GetPlayer().AddtoFaction(DA11CannibalAttackFaction)
VerulusREF.AddtoFaction(DA11CannibalAttackFaction)
VerulusREF.SetRestrained(False)
VerulusREF.SetAV("Health", 50)

HogniREF.AddToFaction(pAttackPlayerFaction)
HogniREF.SetAv("Aggression", 2)
HogniREF.SetAv("Confidence", 4)

LisbetREF.AddToFaction(pAttackPlayerFaction)
LisbetREF.SetAv("Aggression", 2)
LisbetREF.SetAv("Confidence", 4)

BanningREF.AddToFaction(pAttackPlayerFaction)
BanningREF.SetAv("Aggression", 2)
BanningREF.SetAv("Confidence", 4)

Cultist01REF.AddToFaction(pAttackPlayerFaction)
Cultist01REF.SetAv("Aggression", 2)
Cultist01REF.SetAv("Confidence", 4)

Cultist02REF.AddToFaction(pAttackPlayerFaction)
Cultist02REF.SetAv("Aggression", 2)
Cultist02REF.SetAv("Confidence", 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Verulus dies outside the shrine room
Alias_Glooredhel.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -2)
pDA11FIN.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Glooredhel is dead, quest fails
FailAllObjectives()

;Verulus gets up
Alias_BrotherVerulus.GetActorRef().SetRestrained(0)
Alias_BrotherVerulus.GetActorRef().BlockActivation(False)
Alias_BrotherVerulus.GetActorRef().StopCombatAlarm()
pDA11FIN.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
SetObjectiveCompleted(15, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

;Glooredhel moves to the shrine room
Alias_Glooredhel.GetActorRef().EvaluatePackage()

;Give player some gold
game.GetPlayer().AddItem(Gold, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
If GetStageDone(17) == 0
  SetObjectiveCompleted(10, 1)
  SetObjectiveDisplayed(20, 1)
EndIf

;Glooredhel forcegreets the player
Alias_Glooredhel.GetActorRef().EvaluatePackage()
Alias_Glooredhel.GetActorRef().SetPlayerTeammate(0)

;setup the cave
dunReachcliffSecExitDoor.Activate(Game.GetPlayer())
dunReachcliffExitMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player attack Eola in the Hall of the dead
Actor EolaRef = Alias_Glooredhel.GetActorRef()

EolaRef.AddToFaction(pAttackPlayerFaction)
EolaRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Verulus stops following the player
Alias_BrotherVerulus.GetActorRef().SetPlayerTeammate(0)

;Play Verulus and Glooredhel scene
pVerulusGlooredhelScene.Start()

;Only allow Verulus's OnActivate script
Alias_BrotherVerulus.GetActorRef().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Glooredhel forcegreets the player
Alias_Glooredhel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

;Verulus now follows the player
Alias_BrotherVerulus.GetActorRef().EvaluatePackage()
Alias_BrotherVerulus.GetActorRef().SetPlayerTeammate()
Game.GetPlayer().AddtoFaction(pVerulusAllyFaction)

;Setup the feast hall
pReachcliffPreQuestMarker.Disable()
pReachcliffNormalMarker.Disable()
dunReachcliffDA11.Enable()
Actor HogniREF = Alias_Hogni.GetActorRef()
Actor LisbetREF = Alias_Lisbet.GetActorRef()
Actor BanningREF = Alias_Banning.GetActorRef()

If HogniREF.IsDead() == False
  HogniREF.MoveTo(FeastHallMarker)
  HogniREF.SetCrimeFaction(DA11CannibalFaction)
  HogniREF.RemoveFromFaction(CrimeFactionReach)
EndIf

If LisbetREF.IsDead() == False
  LisbetREF.MoveTo(FeastHallMarker)
  LisbetREF.SetCrimeFaction(DA11CannibalFaction)
  LisbetREF.RemoveFromFaction(CrimeFactionReach)
EndIf

If BanningREF.IsDead() == False
  BanningREF.MoveTo(FeastHallMarker)
  BanningREF.SetCrimeFaction(DA11CannibalFaction)
  BanningREF.RemoveFromFaction(CrimeFactionReach)
EndIf

Alias_Cultist01.GetActorRef().Enable()
Alias_Cultist02.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Move everyone back if they're alive and shut everything down

Actor HogniREF = Alias_Hogni.GetActorRef()
Actor LisbetREF = Alias_Lisbet.GetActorRef()
Actor BanningREF = Alias_Banning.GetActorRef()

If HogniREF.IsDead() == False
  HogniREF .MoveTo(CenterMarkarthMarker)
  HogniREF.AddtoFaction(CrimeFactionReach)
  HogniREF.RemoveFromFaction(DA11CannibalFaction)
  HogniREF.SetCrimeFaction(CrimeFactionReach)
EndIf

If LisbetREF.IsDead() == False
  LisbetREF.MoveTo(CenterMarkarthMarker)
  LisbetREF.AddtoFaction(CrimeFactionReach)
  LisbetREF.RemoveFromFaction(DA11CannibalFaction)
  LisbetREF.SetCrimeFaction(CrimeFactionReach)
EndIf

If BanningREF.IsDead() == False
  BanningREF.MoveTo(CenterMarkarthMarker)
  BanningREF.AddtoFaction(CrimeFactionReach)
  BanningREF.RemoveFromFaction(DA11CannibalFaction)
  BanningREF.SetCrimeFaction(CrimeFactionReach)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;Quest completes
;Glooredhel is now player's ally
AchievementsQuest.IncDaedricQuests()
AchievementsQuest.IncDaedricArtifacts()
Alias_Glooredhel.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3)

SetObjectiveCompleted(60, 1)
pDA11FIN.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;Player gets the ring
Game.GetPlayer().AddItem(pRingofNamira, 1)

;allow player to loot Verulus
Alias_BrotherVerulus.GetActorRef().BlockActivation(false)

;Trigger Namira scene
;pDA11NamiraScene.Start()

Alias_VoiceofNamira.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA11QuestScript
Quest __temp = self as Quest
DA11QuestScript kmyQuest = __temp as DA11QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
Actor EolaREF = Alias_Glooredhel.GetActorRef()

;set the DA11 favor
pDA11Favor.SetStage(15)

Game.GetPlayer().AddToFaction(pGlooredhelAllyFaction)
Invisibility.Cast(EolaREF, EolaREF)
EolaREF.EvaluatePackage()

;add a map marker to Reachcliff
pReachcliffMapMarker.AddtoMap()

;Setup the cave
ReachcliffCave01.Reset()
dunReachcliffBlockerMarker.Disable()
pReachcliffNormalMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;Verulus is dead in the shrine room. Trigger feast
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)

;Only allow Verulus's OnActivate script
Alias_BrotherVerulus.GetActorRef().BlockActivation()

;Unlock the doors
Alias_ShrineDoor.GetRef().Lock(false)

;Glooredhel tells the player to eat
pVerulusDeadScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property GlooredhelVerulusScene  Auto  

Scene Property VerulusDeadScene  Auto  

MiscObject Property Gold  Auto  

ObjectReference Property MarkarthKeepDoor  Auto  

Quest Property pDA11Favor  Auto  

Faction Property pAttackPlayerFaction  Auto  

Scene Property pGlooredhelHallForcegreetScene  Auto  

Scene Property pGlooredhelFollowPlayerScene auto

Scene Property pReachcliffCleansedScene  Auto  

Scene Property pVerulusGlooredhelScene  Auto  

Faction Property pGlooredhelAllyFaction  Auto  

ActorBase Property pVerulusActorBase  Auto  

Scene Property pVerulusFollowPlayerScene  Auto  

Quest Property pDA11FIN  Auto  

Faction Property pGlooredhelVerulusAttackFaction  Auto  

Armor Property pRingofNamira  Auto  

Scene Property pDA11NamiraScene  Auto  

MiscObject Property pGold  Auto  

GlobalVariable Property pFavorReward  Auto  

Scene Property pVerulusForcegreetScene  Auto  

Scene Property pVerulusDeadScene  Auto  

ActorBase Property pGlooredhelActorBase  Auto  

Faction Property pVerulusAllyFaction  Auto  

ObjectReference Property pReachCliffMapMarker  Auto  

ObjectReference Property pReachcliffNormalMarker  Auto  

ObjectReference Property pReachcliffPreQuestMarker  Auto  

int Property NewProperty  Auto  

Spell Property Invisibility  Auto  

ObjectReference Property FeastHallMarker  Auto  

ObjectReference Property MarkarthCenterMarkerREF  Auto  

ObjectReference Property CenterMarkarthMarker  Auto  

Faction Property CrimeFactionReach  Auto  

ObjectReference Property dunReachcliffBlockerMarker  Auto  

ObjectReference Property dunReachcliffSecExitDoor  Auto  

ObjectReference Property dunReachcliffexitMarker  Auto  

ObjectReference Property dunReachcliffDA11  Auto  

Faction Property DA11CannibalAttackFaction  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Cell Property ReachcliffCave01  Auto  

Faction Property DA11CannibalFaction  Auto  
