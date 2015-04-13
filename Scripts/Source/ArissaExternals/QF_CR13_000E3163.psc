;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_CR13_000E3163 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EternalFlame
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EternalFlame Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VilkasSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VilkasSpirit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarkasSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarkasSpirit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CovenMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CovenMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Coven
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Coven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Witch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetSpirit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HEAD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HEAD Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

Alias_Questgiver.GetActorReference().SetPlayerTeammate(false, false)
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).CleanupFollowerState()

Followup.Start()
(Followup as CRTwinsPostQuestScript).SetSandbox(Alias_Questgiver.GetActorRef(), Alias_EternalFlame.GetRef())
Followup.SetStage(1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Alias_Questgiver.GetActorReference().SetPlayerTeammate(true, false)
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).SwapFollowers()
Alias_Questgiver.GetActorReference().RemoveFromFaction(IsGuardFaction)
Alias_Questgiver.GetActorReference().RemoveFromFaction(PotentialFollowerFaction)
Alias_Questgiver.GetActorReference().EvaluatePackage()

; Debug.Trace("CRQ: Accepting " + kmyQuest + ".")
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).AcceptRadiantQuest(Alias_Questgiver.GetActorReference(), true)
kmyQuest.IsAccepted = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(17, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CR13QuestScript
Quest __temp = self as Quest
CR13QuestScript kmyQuest = __temp as CR13QuestScript
;END AUTOCAST
;BEGIN CODE
if (IsObjectiveDisplayed(10))
	SetObjectiveCompleted(10)
endif
SetObjectiveDisplayed(15)

if (!GetStageDone(10))
	Alias_Questgiver.GetActorReference().SetPlayerTeammate(true, false)
	(kmyQuest.ParentQuest as CompanionsHousekeepingScript).SwapFollowers()
	Alias_Questgiver.GetActorReference().EvaluatePackage()
endif

if (!kmyQuest.IsAccepted)
; 	Debug.Trace("CRQ: Accepting " + kmyQuest + ".")
	(kmyQuest.ParentQuest as CompanionsHousekeepingScript).AcceptRadiantQuest(Alias_Questgiver.GetActorReference(), true)
	kmyQuest.IsAccepted = True 
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Followup  Auto  

Faction Property IsGuardFaction  Auto  

Faction Property PotentialFollowerFaction  Auto  
