;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF_T01_00023B6C Extends Quest Hidden

;BEGIN ALIAS PROPERTY EnmonReserved
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnmonReserved Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Degaine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Degaine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnerSanctum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnerSanctum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FjotraSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FjotraSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hometown
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hometown Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Temple
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Temple Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Senna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Senna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrokenTowerRedoubt
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BrokenTowerRedoubt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnerSanctumDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnerSanctumDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HometownLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HometownLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnmonEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnmonEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fjotra
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fjotra Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enmon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enmon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hamal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hamal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HamalEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HamalEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Anwen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Anwen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chalice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chalice Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
Alias_EnmonReserved.ForceRefTo(Alias_Enmon.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
FailAllObjectives()

Alias_EnmonReserved.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveCompleted(30, 1)

Alias_Hamal.GetActorRef().AddToFaction(TrainerFaction)

Alias_EnmonReserved.Clear()
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(100, 1)

Alias_Altar.GetRef().Disable()
Game.GetPlayer().AddPerk(DibellaPerk)
Game.GetPlayer().AddSpell(PerkAbility)
Alias_Hamal.GetActorRef().AddToFaction(TrainerFaction)

Alias_EnmonReserved.Clear()

;make Dibella priestesses like the player
Alias_Hamal.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Orla.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Anwen.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Senna.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE T01QuestScript
Quest __temp = self as Quest
T01QuestScript kmyQuest = __temp as T01QuestScript
;END AUTOCAST
;BEGIN CODE
if (ReunionScene.IsPlaying())
    ReunionScene.Stop()
endif

SetObjectiveCompleted(80, 1)
SetObjectiveDisplayed(100, 1)

Alias_Altar.GetRef().Enable()

kmyQuest.EnmonShouldFollow = False
Alias_Enmon.GetActorReference().SetPlayerTeammate(false)
Alias_Enmon.GetActorReference().RemoveFromFaction(EnmonLovesPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

Alias_EnmonEssential.Clear()
RedoubtMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE T01QuestScript
Quest __temp = self as Quest
T01QuestScript kmyQuest = __temp as T01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(80, 1)

Alias_Chalice.GetRef().Disable()
Alias_EnmonEssential.Clear()
Alias_Fjotra.GetActorRef().SetRestrained(0)

if ((kmyQuest.EnmonShouldFollow) && !Alias_Enmon.GetActorRef().IsDead())
   ReunionRedoubtScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE T01QuestScript
Quest __temp = self as Quest
T01QuestScript kmyQuest = __temp as T01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(30, 0)
SetObjectiveDisplayed(60, 1)

if (!T01DegaineFavor.GetStageDone(10))
	T01DegaineFavor.Stop()
endif
T01Intro.Stop()

UnregisterForUpdate()
Alias_InnerSanctumDoor.GetRef().Lock(false)
Alias_Fjotra.GetRef().MoveTo(Alias_FjotraSpot.GetRef())
Alias_Fjotra.GetActorRef().SetRestrained(1)
Alias_Fjotra.GetRef().Enable()

KarthwastenMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property KarthwastenMarker  Auto  

ObjectReference Property RedoubtMarker  Auto  

Scene Property ReunionRedoubtScene  Auto  

Quest Property T01Intro  Auto  

Perk Property DibellaPerk  Auto  

Faction Property TrainerFaction  Auto  

Quest Property T01DegaineFavor  Auto  

Spell Property PerkAbility  Auto  

Scene Property ReunionScene  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Faction Property EnmonLovesPlayer  Auto  
