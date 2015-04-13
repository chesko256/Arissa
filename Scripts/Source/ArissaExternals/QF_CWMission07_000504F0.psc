;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_CWMission07_000504F0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AttackPoint
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackPoint Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushMarkerFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushMarkerFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanToggle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanToggle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackPointReservationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackPointReservationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackPointCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackPointCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FriendHadvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FriendHadvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FieldCO
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FieldCO Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldierFriendly1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldierFriendly1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackPointEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackPointEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanToggleSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanToggleSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanFriendMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanFriendMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InformantLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InformantLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrivacyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrivacyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushCoverMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushCoverMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CaravanLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldierFriendly2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldierFriendly2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampaignStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CampaignStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MissionNumberRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MissionNumberRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardsDwelling
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StewardsDwelling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardsContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardsContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evidence
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evidence Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanToggleImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanToggleImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FriendRalof
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FriendRalof Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanSoldier6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaravanSoldier6 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;Player is told to meet up and attack the caravan
; ; debug.traceConditional("CWMission07 stage 40", kmyquest.CWs.debugon.value)

(Alias_Steward as CWMission07StewardScript).MonitorPlayerDistance(False)

Alias_Friend.TryToMoveTo(Alias_CaravanFriendMarker.GetReference())

Alias_CaravanToggle.TryToEnable()

setObjectiveCompleted(30)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission07 stage 20", kmyquest.CWs.debugon.value)
setObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;friendlys moving to covering positions
setObjectiveCompleted(50)
setObjectiveDisplayed(60)

if kmyquest.CWs.PlayerAllegiance == 1 ; imperial
	Alias_CaravanSoldier1.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)
	Alias_CaravanSoldier2.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)
	Alias_CaravanSoldier3.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)
	Alias_CaravanSoldier4.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)
	Alias_CaravanSoldier5.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)
	Alias_CaravanSoldier6.GetActorReference().AddToFaction(kmyquest.CWs.CWSonsFactionNPC)

else ; Assume 2, Stormcloak
	Alias_CaravanSoldier1.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)
	Alias_CaravanSoldier2.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)
	Alias_CaravanSoldier3.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)
	Alias_CaravanSoldier4.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)
	Alias_CaravanSoldier5.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)
	Alias_CaravanSoldier6.GetActorReference().AddToFaction(kmyquest.CWs.CWImperialFactionNPC)

endif


Alias_Friend.TryToEvaluatePackage()
Alias_CaravanSoldierFriendly1.TryToEvaluatePackage()
Alias_CaravanSoldierFriendly2.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;ambushers should fire
Alias_Friend.GetActorReference().EvaluatePackage()
Alias_CaravanSoldierFriendly1.GetActorReference().EvaluatePackage()
Alias_CaravanSoldierFriendly2.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission07 stage 10", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithActiveQuestFaction(MissionType = 7)

Alias_Evidence.TryToEnable()

kmyquest.EnableMapMarkerAlias(Alias_MapMarker)

SetObjectiveDisplayed(10)

;Enable created references in aliases
;*** TO DO: When we get arrays, CreateMissionAliasedActor() function could put actors in an array when creating them initally disabled, and then a new function could be written to enable all actors in that array)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;friend made it into position, will now say fire when enemy hits trigger box
;see CWMission07AmbushTravel result script
;and CWMission07TriggerScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Evidence.GetReference())

setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;Friend told the player his plan (used for dialogue conditions)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;Fail quest

; ; debug.traceConditional("CWMission07 stage 205 FAILURE!!!", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithMissionResultFaction(7, MissionFailure = true)

UnregisterForUpdate()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;player wants to do it alone
setObjectiveCompleted(50)
setObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission07 Stage 0: Quest Started in " + Alias_AttackPoint.GetLocation(), kmyquest.CWs.debugon.value)
;debug.messageBox("CWMission07 Started")

kmyquest.FlagFieldCOWithPotentialMissionFactions(7) ;7 = Blackmail Steward (this quest type)

kmyquest.ResetCommonMissionProperties()

; ; debug.traceConditional("CWMission07 stage 0: creating evidence and forcing into alias", kmyquest.CWs.debugon.value)

ObjectReference StewardsContainer = Alias_StewardsContainer.GetReference()

if kmyquest.CWs.PlayerAllegiance == kmyquest.CWs.iImperials
	Alias_Evidence.ForceRefTo(StewardsContainer.placeAtMe(kmyquest.CWMission07EvidenceRiften))	
else
	Alias_Evidence.ForceRefTo(StewardsContainer.placeAtMe(kmyquest.CWMission07EvidenceMarkarth))	

endif

StewardsContainer.AddItem(Alias_Evidence.GetReference())

Alias_Evidence.TryToDisable()

; ; debug.traceConditional("CWMission07 stage 0: Removing caravan soldiers from civil war NPC factions", kmyquest.CWs.debugon.value)
Alias_CaravanSoldier1.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier2.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier3.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier4.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier5.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier6.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWImperialFactionNPC)
Alias_CaravanSoldier1.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)
Alias_CaravanSoldier2.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)
Alias_CaravanSoldier3.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)
Alias_CaravanSoldier4.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)
Alias_CaravanSoldier5.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)
Alias_CaravanSoldier6.GetActorReference().RemoveFromFaction(kmyquest.CWs.CWSonsFactionNPC)



; ; debug.traceConditional("CWMission07 stage 0: turning off complex WI interactions", kmyquest.CWs.debugon.value)
kmyquest.ToggleOffComplexWIInteractions(Alias_AttackPoint)

;RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Steward told player to come to a private place

Alias_Steward.GetActorReference().EvaluatePackage()

;this puts the player in the CW faction of the steward, and thus the guards, so they'll leave him alone
;this faction is then removed when the player gets too far away from the steward
(Alias_Steward as CWMission07StewardScript).MonitorPlayerDistance(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;Successfully complete quest

; ; debug.traceConditional("CWMission07 stage 200 SUCCESS!!!", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithMissionResultFaction(7)

kmyquest.CWs.CWMission07Done = 1 ;used to conditionalize story manager node

kmyquest.CWs.registerMissionSuccess(Alias_Hold.GetLocation())

UnregisterForUpdate()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;shut down stage --  clean up created references, etc.
;NOTE: campaign should be advanced prior to this quest stage

; ; debug.traceConditional("CWMission07 stage 255 (shut down phase)", kmyquest.CWs.debugon.value)
kmyquest.ProcessFieldCOFactionsOnQuestShutDown()

Alias_Friend.GetActorReference().AddToFaction(kmyquest.CWs.CWBuddies)

UnregisterForUpdate()

; ; debug.traceConditional("CWMission07 stage 255: turning on complex WI interactions", kmyquest.CWs.debugon.value)
kmyquest.ToggleOnComplexWIInteractions(Alias_AttackPoint)

;delete created references
;*** TO DO: When we have arrays, CreateMissionAliasedActor should put all created references to an array, then a new funciton should delete ALL of them
Alias_Evidence.GetReference().delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;player should talk to friend
setObjectiveCompleted(60)
setObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission01 stage 100", kmyquest.CWs.debugon.value)
kmyquest.objectiveCompleted = 1
setObjectiveCompleted(90)

; ; debug.traceConditional("CWMission01 stage 100: adding steward to CWMission07BlackmailedFaction", kmyquest.CWs.debugon.value)
Alias_Steward.GetActorReference().AddToFaction(kmyquest.CWMission07BlackmailedFaction)

;EITHER A) Report back to FieldCO
;setObjectiveDisplayed(100)

;OR B) immediate success
setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CWMission07Script
Quest __temp = self as Quest
CWMission07Script kmyQuest = __temp as CWMission07Script
;END AUTOCAST
;BEGIN CODE
;start the attack
; ; debug.traceConditional("CWMission07 stage 50", kmyquest.CWs.debugon.value)
Alias_Friend.GetActorReference().EvaluatePackage()
Alias_CaravanSoldierFriendly1.GetActorReference().EvaluatePackage()
Alias_CaravanSoldierFriendly2.GetActorReference().EvaluatePackage()

setObjectiveCompleted(40)
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
