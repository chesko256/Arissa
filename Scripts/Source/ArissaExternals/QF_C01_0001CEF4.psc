;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_C01_0001CEF4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Eorlund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eorlund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sidekick
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sidekick Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlakWhitemane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlakWhitemane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KrevTheSkinner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KrevTheSkinner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsRock
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GallowsRock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Font
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Font Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UnderforgeDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UnderforgeDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)

Alias_Aela.GetRef().RemoveAllItems(LycanStash)
; Debug.Trace("C03: Setting race " + WerewolfRace + " on " + Alias_Aela.GetActorReference())
Alias_Aela.GetActorRef().SetRace(WerewolfRace)
Alias_Aela.GetRef().MoveTo(AelaStandSpot)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).TempUnderforgeAccess = true
SpielScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)

PostRampageHandling(kmyQuest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutdownRadiantQuestsFor(Alias_Aela.GetActorRef())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutdownRadiantQuestsFor(Alias_Skjor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutdownRadiantQuests()
Actor sidekick = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).GetFavoriteQuestgiver()
Alias_Sidekick.ForceRefTo(sidekick)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(15)
setObjectiveDisplayed(20)

Alias_Font.GetRef().Enable()

CRReconKicker.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(5)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveCompleted(31, 1)

Alias_Aela.GetActorReference().SetPlayerTeammate(false, false)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CleanupFollowerState()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CurrentFollower.Clear()
Alias_Aela.GetActorRef().AddToFaction(IsGuardFaction)

CommentaryEnabler.Disable()
kmyQuest.PlayerGotReward = false
Faction comps = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompanionsFaction
Game.GetPlayer().ModFactionRank(comps, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutDownRadiantQuests(Alias_Aela.GetActorRef())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE C03QuestScript
Quest __temp = self as Quest
C03QuestScript kmyQuest = __temp as C03QuestScript
;END AUTOCAST
;BEGIN CODE
PostRampageHandling(kmyQuest)

if (!IsObjectiveCompleted(20))
	SetObjectiveCompleted(20)
endif

if (kmyQuest.CheckedInWithAela)
    SetObjectiveCompleted(25)
else
    SetObjectiveFailed(25)
endif
SetObjectiveDisplayed(30)
AelaPostTransformScene.Stop()
Alias_Aela.GetActorReference().SetPlayerTeammate(true, false)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).SwapFollowers()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Aela.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CurrentFollower.ForceRefTo(Alias_Aela.GetRef())
Alias_Aela.GetActorRef().RemoveFromFaction(IsGuardFaction)
Alias_Aela.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property GallowsRockMarker  Auto  

Scene Property SpielScene  Auto  

ObjectReference Property GWEntryTrigger  Auto  

Scene Property AelaPostTransformScene  Auto  

Race Property WerewolfRace  Auto  

ObjectReference Property LycanStash  Auto  

Keyword Property CRReconKicker  Auto  

ObjectReference Property CommentaryEnabler  Auto  

Spell Property BeastForm  Auto  

ObjectReference Property AelaStandSpot  Auto  

Faction Property IsGuardFaction  Auto  



bool __postRampageHandled = false

Function PostRampageHandling(C03QuestScript kmyQuest)
	if (__postRampageHandled)
		return
	endif

	__postRampageHandled = true
	GallowsRockMarker.AddToMap()
	kmyQuest.SilverHandEnableMarker.Disable()
	GWEntryTrigger.Enable()
	Alias_Font.GetRef().Disable()
	(kmyQuest.CentralQuest as CompanionsHousekeepingScript).PlayerHasBeastBlood = true
	(kmyQuest.CentralQuest as CompanionsHousekeepingScript).PlayerIsWerewolf.SetValueInt(1)

	Game.AddAchievement(10)
EndFunction
