;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF_MS10_0001DBFC Extends Quest Hidden

;BEGIN ALIAS PROPERTY StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BloodHorkerOrders
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BloodHorkerOrders Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShacksOff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShacksOff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pirate1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pirate1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TransitMerc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TransitMerc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JaphetsFolly
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_JaphetsFolly Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShipAtIsland
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShipAtIsland Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Adelaisa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Adelaisa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoatMarkerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoatMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pirate3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pirate3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoatMarkerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoatMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pirate2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pirate2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orthus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orthus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FogMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FogMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnstarMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnstarMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecretIslandDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SecretIslandDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShipInWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShipInWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnDoorTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnDoorTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoatAttackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoatAttackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShacksOn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShacksOn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SuvarisJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SuvarisJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmDockDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmDockDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Haldyn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Haldyn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WreckageMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WreckageMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

Alias_FogMarker.GetReference().Disable()
Alias_BoatMarkerA.GetReference().Disable()
Alias_BoatMarkerB.GetReference().Disable()
Alias_WreckageMarker.GetReference().Enable()
Alias_BoatAttackMarker.GetReference().Enable()
Alias_ShacksOn.GetReference().disable()
Alias_ShacksOff.GetReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE ms10questscript
Quest __temp = self as Quest
ms10questscript kmyQuest = __temp as ms10questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(41, 1)
SetObjectiveDisplayed(42, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE ms10questscript
Quest __temp = self as Quest
ms10questscript kmyQuest = __temp as ms10questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

Alias_ShipInWindhelm.GetRef().Enable()
Alias_TransitMerc.GetRef().Enable()
Alias_Adelaisa.GetRef().Enable()
Alias_BoatMarkerA.GetReference().Enable()
Alias_BoatMarkerB.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(41, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
if (!IsObjectiveFailed(41))
    SetObjectiveCompleted(42, 1)
endif
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(80, 1)

Game.GetPlayer().AddItem(Reward)
Alias_Orthus.GetActorRef().MakePlayerFriend()
Alias_Adelaisa.GetActorRef().MakePlayerFriend()
Alias_BoatAttackMarker.GetReference().Disable()

MS10PostQuest.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
SetObjectiveCompleted(75, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

Alias_DawnstarMapMarker.GetRef().AddToMap()
; Spawn Pirates in Dawnstar
Alias_Stig.GetReference().Enable()
Alias_Pirate1.GetReference().Enable()
Alias_Pirate2.GetReference().Enable()
Alias_Pirate3.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(75, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (PointerQuest.GetStage() == 10)
	PointerQuest.SetStage(20)
endif

if (Game.GetPlayer().GetItemCount(SuvarisJournal.GetRef()) == 0)
	SetObjectiveDisplayed(10, 1)
else
	SetStage(20)
endif

if pTG04EECQuest.IsObjectiveDisplayed(10) == 1
pTG04EECQuest.SetObjectiveCompleted(10,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MajorFavor  Auto  

Quest Property MS10PostQuest  Auto  

ReferenceAlias Property SuvarisJournal  Auto  

Quest Property pTG04EECQuest  Auto  

LeveledItem Property Reward  Auto

Quest Property Pointerquest  Auto  

AchievementsScript Property AchievementsQuest  Auto  
