;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_CWMission03_0003BCC4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FieldCO
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FieldCO Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerBSons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerBSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnB
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_InnB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FieldCOMorthal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FieldCOMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBImperial2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperBImperial2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MissionNumberRef
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MissionNumberRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCapital
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_EnemyCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerASons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerASons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PackageSons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PackageSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TownA
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_TownA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BedA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BedA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BedB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BedB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperAImperial
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperAImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TownB
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_TownB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierSpawnMarkerImperial
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CourierSpawnMarkerImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperASons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperASons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierSpawnMarkerSons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CourierSpawnMarkerSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampaignStartMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CampaignStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FieldCODawnstar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FieldCODawnstar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnA
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_InnA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBImperial1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperBImperial1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForgedDocuments
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ForgedDocuments Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Horse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyFieldCO
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EnemyFieldCO Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerAImperial
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerAImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PackageImperial
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PackageImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierSpawnMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CourierSpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBSons
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperBSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnMarkerBImperial
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnMarkerBImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerCapital
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarkerCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;shut down stage --  clean up created references, etc.
;NOTE: campaign should be advanced prior to this quest stage

; ; debug.traceConditional("CWMission03 stage 255 (shut down phase)", kmyquest.CWs.debugon.value)
kmyquest.ProcessFieldCOFactionsOnQuestShutDown()

Alias_InnkeeperA.GetActorReference().RemoveFromFaction(kmyquest.CWs.FavorAllowBribeFaction)
Alias_InnkeeperB.GetActorReference().RemoveFromFaction(kmyquest.CWs.FavorAllowBribeFaction)

UnregisterForUpdate()

; ; debug.traceConditional("CWMission03 stage 255: turning on complex WI interactions", kmyquest.CWs.debugon.value)
kmyquest.ToggleOnComplexWIInteractions(Alias_TownA)
kmyquest.ToggleOnComplexWIInteractions(Alias_TownB)

;delete created references
;*** TO DO: When we have arrays, CreateMissionAliasedActor should put all created references to an array, then a new funciton should delete ALL of them
Alias_Courier.GetReference().DeleteWhenAble()
Alias_Horse.GetReference().DeleteWhenAble()
Alias_PackageImperial.GetReference().DeleteWhenAble()
Alias_PackageSons.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission03 stage 100", kmyquest.CWs.debugon.value)
kmyquest.objectiveCompleted = 1

setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_ForgedDocuments.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;if i don't do this the enemy field co often attacks the player because he knows the player attacked a member of his faction
kmyquest.CWs.ClearActorsEnemyFlagOnCrimeFactions(Alias_EnemyFieldCO.GetActorReference())

Alias_MapMarkerCapital.GetReference().addToMap()
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
Game.GetPlayer().RemoveItem(Alias_ForgedDocuments.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;token reward from the enemy field co
Game.GetPlayer().addItem(kmyquest.CWs.Gold001, 5)

setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission03 stage 31", kmyquest.CWs.debugon.value)

ObjectReference PackageImperial = Alias_PackageImperial.GetReference()
ObjectReference PackageSons = Alias_PackageSons.GetReference()

if kmyquest.CWs.PlayerAllegiance == kmyquest.CWs.iImperials
	Alias_FieldCO.GetReference().addItem(PackageSons)
	Alias_ForgedDocuments.ForceRefTo(PackageSons)

else
	Alias_FieldCO.GetReference().addItem(PackageImperial)
	Alias_ForgedDocuments.ForceRefTo(PackageImperial)

endif

setObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;INKEEPER B TOLD PLAYER ABOUT COURIER
; ; debug.traceConditional("CWMission03 stage 21", kmyquest.CWs.debugon.value)
setObjectiveCompleted(10)
setObjectiveDisplayed(20)

;just in case we somehow failed to do this when the player entered the inn
Alias_Horse.GetReference().Enable()
Alias_Courier.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission03 stage 30", kmyquest.CWs.debugon.value)
setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;player has arrived in one of the inns (set by CWPlayerScript attached to Player Alias)

;HORSE IS CAUSING PROBLEMS, LEAVING DISABLED FOR NOW
;Alias_Horse.GetReference().Enable()

Alias_Courier.GetReference().Enable()

;Alias_Courier.GetActorReference().SetVehicle(Alias_Horse.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission03 stage 10", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithActiveQuestFaction(MissionType = 3)

kmyquest.EnableMapMarkerAlias(Alias_MapMarkerA)
kmyquest.EnableMapMarkerAlias(Alias_MapMarkerB)
SetObjectiveDisplayed(10)

;Enable created references in aliases


;NOTE: this is called on QUEST therefore the quest script recieves the event
RegisterForSingleLOSGain(Game.GetPlayer(), Alias_Courier.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;INKEEPER A TOLD PLAYER ABOUT COURIER
; ; debug.traceConditional("CWMission03 stage 20", kmyquest.CWs.debugon.value)
setObjectiveCompleted(10)
setObjectiveDisplayed(20)

;just in case we somehow failed to do this when the player entered the inn
Alias_Horse.GetReference().Enable()
Alias_Courier.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
; ; debug.traceConditional("CWMission03 Stage 0: Quest Started", kmyquest.CWs.debugon.value)
;debug.messageBox("CWMission03 Started")

kmyquest.FlagFieldCOWithPotentialMissionFactions(3) ;3 = Intercept Courier (this quest type)

kmyquest.ResetCommonMissionProperties()

; ; debug.traceConditional("CWMission03 stage 0: creating and storing Courier alias, and putting correct package in the courier, and setting horse to be his vehicle", kmyquest.CWs.debugon.value)
kmyquest.CreateAliasedCourierEnemy(Alias_Courier, Alias_CourierSpawnMarker.GetReference(), true)

Actor CourierActor = Alias_Courier.GetActorReference()

if CourierActor.IsInFaction(kmyquest.CWs.CWImperialFaction) == true
	CourierActor.AddItem(Alias_PackageImperial.GetReference())
else
	Alias_PackageImperial.GetReference().disable()
endif
	
if CourierActor.IsInFaction(kmyquest.CWs.CWSonsFaction) == true
	CourierActor.AddItem(Alias_PackageSons.GetReference())
else
	Alias_PackageSons.GetReference().disable()
endif


; ; debug.traceConditional("CWMission03 stage 0: turning off complex WI interactions", kmyquest.CWs.debugon.value)
kmyquest.ToggleOffComplexWIInteractions(Alias_TownA)
kmyquest.ToggleOffComplexWIInteractions(Alias_TownB)

RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;Successfully complete quest

; ; debug.traceConditional("CWMission03 stage 200 SUCCESS!!!", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithMissionResultFaction(3)

kmyquest.CWs.CWMission03Done = 1 ;used to conditionalize story manager node

kmyquest.CWs.registerMissionSuccess(Alias_Hold.GetLocation())

UnregisterForUpdate()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CWMission03Script
Quest __temp = self as Quest
CWMission03Script kmyQuest = __temp as CWMission03Script
;END AUTOCAST
;BEGIN CODE
;Fail quest

; ; debug.traceConditional("CWMission03 stage 205 FAILURE!!!", kmyquest.CWs.debugon.value)

kmyquest.FlagFieldCOWithMissionResultFaction(3, MissionFailure = true)

UnregisterForUpdate()

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
