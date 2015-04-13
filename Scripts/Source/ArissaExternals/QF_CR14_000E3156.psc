;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_CR14_000E3156 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DenHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DenHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Den
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Den Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CR14QuestScript
Quest __temp = self as Quest
CR14QuestScript kmyQuest = __temp as CR14QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CR14QuestScript
Quest __temp = self as Quest
CR14QuestScript kmyQuest = __temp as CR14QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

Alias_Questgiver.GetActorRef().SetPlayerTeammate(false, false)
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).CleanupFollowerState()

Followup.Start()
(Followup as CRTwinsPostQuestScript).SetSandbox(Alias_Questgiver.GetActorRef(), Alias_Dragon.GetRef())
Followup.SetStage(1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CR14QuestScript
Quest __temp = self as Quest
CR14QuestScript kmyQuest = __temp as CR14QuestScript
;END AUTOCAST
;BEGIN CODE
;Boss is dead.
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CR14QuestScript
Quest __temp = self as Quest
CR14QuestScript kmyQuest = __temp as CR14QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR14QuestScript
Quest __temp = self as Quest
CR14QuestScript kmyQuest = __temp as CR14QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Alias_Questgiver.GetActorRef().SetPlayerTeammate(true, false)
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).SwapFollowers()
Alias_Questgiver.GetActorReference().RemoveFromFaction(IsGuardFaction)
Alias_Questgiver.GetActorReference().RemoveFromFaction(PotentialFollowerFaction)
Alias_Questgiver.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Followup  Auto  

Faction Property IsGuardFaction  Auto  

Faction Property PotentialFollowerFaction  Auto  
