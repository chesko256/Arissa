;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_MG07_0001F257 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG07LabyrinthianExtDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07LabyrinthianExtDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07GhostEnableParentAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07GhostEnableParentAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07AtmahGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07AtmahGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07GirduinGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07GirduinGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07PriestTauntVoice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07PriestTauntVoice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Worldspace02QTMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Worldspace02QTMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07AncanoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07MurilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07MurilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07ArnielAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07ArnielAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07HafnarGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07HafnarGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07CreatureSpawner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07CreatureSpawner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07FaraldaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07FaraldaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07EstormoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07EstormoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thrall01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thrall01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thrall02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thrall02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07DragonPriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07DragonPriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07StaffAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07StaffAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07CreatureAlias01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07CreatureAlias01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07SavosGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07SavosGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07TolfdirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07TolfdirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07MirabelleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07MirabelleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07Portcullis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07Portcullis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07ElvaliGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07ElvaliGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG07TakesGhostAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG07TakesGhostAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if MG05.GetStage() < 200
MG01.SetStage(200)
MG02.SetStage(200)
MG03.SetStage(200)
MG04.SetStage(200)
MG06.SetStage(200)
MG05.SetStage(200)
endif
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction,5)
If SavosArenRef.isEnabled() == 1
SavosArenRef.Disable()
endif
Alias_MG07LabyrinthianExtDoorAlias.GetReference().Lock(False)
StaffDialogueAlias.ForceRefTo(Alias_MG07StaffAlias.GetReference())
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(80,1)
Alias_MG07EstormoAlias.GetReference().Enable()
Alias_MG07EstormoAlias.GetReference().MoveTo(MG07EstormoWaitMarker)
Alias_MG07EstormoAlias.GetActorReference().EvaluatePackage()
Alias_MG07MirabelleAlias.GetReference().Disable()
BarrierCollisionRef.Enable()
MG05SmallBarrierRef.Disable()
WinterholdCollegeMapMarkerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE MG07QuestScript
Quest __temp = self as Quest
MG07QuestScript kmyQuest = __temp as MG07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10,1)
If kmyQuest.GhostVar == true
Alias_MG07SavosGhostAlias.GetReference().Enable()
;MG07SavosGhostAlias.GetReference().MoveTo()
;MG07SavosPlayerScene1.Start()
endif
LabyrinthianMapMarkerRef.AddToMap()
ObjectReference CreatureRef = CreatureMarker.GetReference().PlaceAtMe(MG07Creature,1,True)
CreatureAlias.ForceRefTo(CreatureRef)
kMyquest.SceneCounter=1
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE MG07QuestScript
Quest __temp = self as Quest
MG07QuestScript kmyQuest = __temp as MG07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(80,1)
Alias_MG07TolfdirAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardMedium.GetValueInt())
MG08.Start()
MG08.SetStage(0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;SetObjectiveCompleted(50,1)
;SetObjectiveDisplayed(60,1)
ThalmorFaction.SetEnemy(PlayerFaction)
ThalmorFaction.SetEnemy(CollegeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;SetObjectiveCompleted(60,1)
;SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_MG07TolfdirAlias.GetReference().Moveto(MG07TolfdirBridgeMarker)
Alias_MG07TolfdirAlias.GetActorReference().EvaluatePackage()
MG07DragonPriestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MG07EstormoWaitMarker  Auto  

ObjectReference Property MG07TolfdirMarker  Auto  

Faction Property ThalmorFaction  Auto  

Faction Property PlayerFaction  Auto  

Faction Property CollegeFaction  Auto  

ReferenceAlias Property CreatureMarker  Auto  



ActorBase Property MG07Creature  Auto  

ReferenceAlias Property CreatureAlias  Auto  

ObjectReference Property MG07TolfdirBridgeMarker  Auto  

Quest Property MG08  Auto  

Quest Property MGDialogueQuest  Auto  

Scene Property MG07DragonPriestScene  Auto  

ObjectReference Property BarrierCollisionRef  Auto  

objectreference Property SavosArenRef  Auto  

ReferenceAlias Property StaffDialogueAlias  Auto  

Quest Property MG01  Auto  

Quest Property MG02  Auto  

Quest Property MG03  Auto  

Quest Property MG04  Auto  

Quest Property MG05  Auto  

Quest Property MG06  Auto  

Scene Property MG07SavosPlayerScene1  Auto  

ObjectReference Property MG05SmallBarrierRef  Auto  

ObjectReference Property WinterholdCollegeMapMarkerRef  Auto  

ObjectReference Property LabyrinthianMapMarkerRef  Auto  
