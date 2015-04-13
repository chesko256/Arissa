;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_DA06_0003B681 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DA06GularzobAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06GularzobAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06AtubAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06AtubAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenOrcWarrior02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GenOrcWarrior02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OgolAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OgolAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06MalacathSpeakerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06MalacathSpeakerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06ShagrolHammerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06ShagrolHammerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06LargashburShrine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06LargashburShrine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06StatueAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06StatueAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06YamarzAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06YamarzAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06Gate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06Gate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06ShagrolAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06ShagrolAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenOrcWarrior03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GenOrcWarrior03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY giant01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_giant01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GularzobAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GularzobAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06GiantAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06GiantAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GarakhAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GarakhAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenOrcWarrior01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GenOrcWarrior01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartSceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartSceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LobAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LobAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA06UgorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA06UgorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
Alias_DA06AtubAlias.GetActorReference().EvaluatePackage()
Alias_DA06Gate.GetReference().Lock(False)
Alias_DA06Gate.GetReference().SetOpen()
DA06PreRitualScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE DA06QuestScript
Quest __temp = self as Quest
DA06QuestScript kmyQuest = __temp as DA06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
DoorEnableMarker.Enable()
DA06DoorEnableParent.Enable()
DA06GiantEnableParent.Enable()
ExteriorClutterEnableMarker.Enable()
kmyQuest.TempYamarzMove=1
Alias_DungeonMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_DA06AtubAlias.GetReference().Moveto(DA06AtubWaitMarker)
Alias_DA06UgorAlias.GetReference().Moveto(DA06UgorSceneMarker)
DA06EnableParent.Enable()
DA06GiantFaction.SetAlly(PreyFaction)
TownLargashburFaction.SetEnemy(PlayerFaction, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
stop()
dunFallowstoneResetMarker.disable()
DA06FailMessage.Show()
LargashburOrcs.SetEnemy(PlayerFaction)
FallowstoneCaveAlias.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
Alias_GarakhAlias.GetActorReference().EvaluatePackage()
Alias_GularzobAlias.GetActorReference().EvaluatePackage()
Alias_LobAlias.GetActorReference().EvaluatePackage()
Alias_OgolAlias.GetActorReference().EvaluatePackage()
Alias_DA06Gate.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(120,1)
dunFallowstoneResetMarker.disable()
AchievementsQuest.IncDaedricQuests()
AchievementsQuest.IncDaedricArtifacts()
Game.GetPlayer().AddToFaction(OrcFriendFaction)
Game.GetPlayer().SetRelationshipRank((Alias_GarakhAlias.GetReference() as Actor),1)
Game.GetPlayer().SetRelationshipRank((Alias_GularzobAlias.GetReference() as Actor),1)
Game.GetPlayer().SetRelationshipRank((Alias_LobAlias.GetReference() as Actor),1)
Game.GetPlayer().SetRelationshipRank((Alias_DA06UgorAlias.GetReference() as Actor),1)
Game.GetPlayer().SetRelationshipRank((Alias_DA06AtubAlias.GetReference() as Actor),1)
Game.GetPlayer().SetRelationshipRank((Alias_OgolAlias.GetReference() as Actor),1)
FallowstoneCaveAlias.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE DA06QuestScript
Quest __temp = self as Quest
DA06QuestScript kmyQuest = __temp as DA06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
;(Alias_DA06YamarzAlias.GetActorReference().GetBaseObject() as ActorBase).SetEssential(False)
Alias_DA06YamarzAlias.GetActorReference().RemoveFromFaction(GuardFaction)
Alias_DA06YamarzAlias.GetActorReference().RemoveFromFaction(TownLargashburFaction)
Alias_DA06YamarzAlias.GetActorReference().SetCrimeFaction(ChickenFaction)
;Alias_DA06YamarzAlias.GetActorReference().SetAV("Aggression",2)
LargashburHorse.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
DA06HammerTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DA06AtubWaitMarker  Auto  

ObjectReference Property DA06UgorSceneMarker  Auto  

Scene Property DA06RitualScene  Auto  

ObjectReference Property DA06AtubRitualMarker  Auto  

ObjectReference Property DA06GhostRitualMarker  Auto  

ObjectReference Property DA06YamarzRitualMarker  Auto  

Scene Property DA06PreRitualScene  Auto  

Message Property DA06FailMessage  Auto  

Faction Property LargashburOrcs  Auto  

Faction Property PlayerFaction  Auto  

ObjectReference Property DoorEnableMarker  Auto  

ObjectReference Property DA06EnableParent  Auto  

Weapon Property Volendrung  Auto  

ObjectReference Property ExteriorClutterEnableMarker  Auto  

Faction Property GuardFaction  Auto  

ObjectReference Property DA06HammerTriggerRef  Auto  

faction Property TownLargashburFaction  Auto  

Faction Property ChickenFaction  Auto  

LocationAlias Property FallowstoneCaveAlias  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Faction Property PreyFaction  Auto  

Faction Property DA06GiantFaction  Auto  

ObjectReference Property LargashburHorse  Auto  

ObjectReference Property DA06DoorEnableParent  Auto  

ObjectReference Property da06GiantEnableParent  Auto  

ObjectReference Property dunFallowstoneResetMarker  Auto  

Faction Property OrcFriendFaction  Auto  
