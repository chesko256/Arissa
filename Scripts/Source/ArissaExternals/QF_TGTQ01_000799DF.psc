;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_TGTQ01_000799DF Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGTQ01SilverMoldAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01SilverMoldAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ01EndonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01EndonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ01DoorActAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01DoorActAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ01ArrivalMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01ArrivalMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ01RhorlakAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01RhorlakAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ01SilverMoldNameAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ01SilverMoldNameAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has Silver Mold... now needs to return to Endon
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Debug Quest StartUp
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGTQ01QuestScript
Quest __temp = self as Quest
TGTQ01QuestScript kmyQuest = __temp as TGTQ01QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Completed - Markarth Now Owned By Thieves Guild
Game.GetPlayer().RemoveItem(kmyQuest.pTGTQ01Mold,1)
Game.GetPlayer().AddItem(pReward)
kmyQuest.pTGRShellQuest.SetStage(195)
pTGFences.SetStage(50)
CompleteAllObjectives()
pTGTQ01Handler.SetStage(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TGTQ01QuestScript
Quest __temp = self as Quest
TGTQ01QuestScript kmyQuest = __temp as TGTQ01QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Enabled and Started in TGRShell by Delvin Mallory
pTGTQ01ChairSwitcher.Enable()
if Game.GetPlayer().GetItemCount(pTGTQ01SilverMold) == 0
pTGTQ01RhorlakEnableMarker.Enable()
endif
SetObjectiveDisplayed(10,1)
Alias_TGTQ01EndonAlias.GetActorRef().EvaluatePackage()
Alias_TGTQ01SilverMoldNameAlias.ForceRefTo(Alias_TGTQ01SilverMoldAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TGTQ01QuestScript
Quest __temp = self as Quest
TGTQ01QuestScript kmyQuest = __temp as TGTQ01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is Searching for Silver Mold
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGTQ01QuestScript
Quest __temp = self as Quest
TGTQ01QuestScript kmyQuest = __temp as TGTQ01QuestScript
;END AUTOCAST
;BEGIN CODE
;Pinewatch Entered - Switch QT and Objective after dealing with Rhorlak
pPinewatchMapMarker.AddToMap()
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
kmyQuest.pTGTQ01Mold.Enable()
kmyQuest.pTGTQ01Enabler.Enable()
kmyquest.RegisterForSingleUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGFences  Auto  

ObjectReference Property pPinewatchMapMarker  Auto  

Quest Property pTGTQ01Handler  Auto  

ObjectReference Property pTGTQ01ChairSwitcher  Auto  

ObjectReference Property pTGTQ01RhorlakEnableMarker  Auto  

MiscObject Property pTGTQ01SilverMold  Auto  

LeveledItem Property pReward  Auto  
