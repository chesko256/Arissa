;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF_TG05_00021551 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG05DoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05DoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG05BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG05KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG05MercerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05MercerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SnowveilWETrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SnowveilWETrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;At the Nordic Puzzle Door
pMercerBase.SetInvulnerable()
Alias_TG05MercerAlias.GetActorRef().SetPlayerTeammate(false)
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Player will now lead Mercer to the Door
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has unlocked the door and the Follow can now continue
pTG05LockedDoorPiece.Activate(pTG05LockedDoorPiece)
Alias_TG05MercerAlias.GetActorRef().EvaluatePackage()
Alias_TG05MercerAlias.GetActorRef().SetPlayerTeammate(abCanDoFavor=false)
kmyQuest.pTG05ExternalDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Done with Nordic Puzzle Door
Alias_TG05MercerAlias.GetActorRef().EvaluatePackage()
UnregisterForUpdate()
pTG05LastTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
completeallobjectives()
pMercerBase.SetInvulnerable(false)
Game.GetPlayer().AddItem(kmyQuest.pTG05GallusJournal,1)
Game.GetPlayer().AddItem(pTG05Reward,1)
Game.GetPlayer().AddItem(pTG05Reward,1)
Game.GetPlayer().AddItem(pTG05Reward,1)
Game.GetPlayer().AddItem(pTG05Reward,1)
Alias_TG05MercerAlias.GetActorReference().ModFavorPoints(-(kmyQuest.pTGFavorLarge.GetValueInt()))
kmyQuest.pTG06Quest.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Move Player to External Dialogue with Karliah, do all appropriate move maintenance
Alias_TG05KarliahAlias.GetActorRef().Enable()
Alias_TG05KarliahAlias.GetActorRef().MoveTo(kmyQuest.pTG05KarliahFinalMarker)
Alias_TG05KarliahAlias.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(kmyQuest.pTG05PlayerAwakenMarker)
pimodWakeUp.ApplyCrossFade()
Game.GetPlayer().PlayIdle(pGetUp)
;Disable Audio Markers
pTG05ArrowHitRef.Disable()
pTG05KarliahVanishAudio.Disable()
pTG05MercerStabAudio.Disable()
pTG05TransitionAudio.Disable()
utility.wait(10)
pTG05QS.pTG05KarliahFG01 = 1
SetObjectiveDisplayed (50,1)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Initiate the Scene at the end of the ruins
kmyQuest.pTG05SPQuest.SetStage(10)
SetObjectiveCompleted(35,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is on the way to Snow Veil Sanctum to meet Mercer
SetObjectiveDisplayed (10,1)
pSnowVeilSanctumMapMarker.AddToMap()
RegisterforSingleUpdate(1)

;Disable Wilderness Encounter near Snowveil (permanently) and enable Karliah's Camp
Alias_SnowveilWETrigger.GetReference().Disable()
pTG05CampEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest Start
pTG00Quest.Stop()
game.GetPlayer().AddItem(kmyQuest.pTG05Lockpicks,10)
Game.GetPlayer().AddToFaction(kmyQuest.pTG05TGFaction)
setstage (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has arrived at the door to the catacombs
kmyQuest.pTG05UnlockScene.Start()
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE TG05QuestScript
Quest __temp = self as Quest
TG05QuestScript kmyQuest = __temp as TG05QuestScript
;END AUTOCAST
;BEGIN CODE
;Scene Tester Debug Stage
pTG00Quest.Stop()
setstage (10)
setstage (20)
setstage (30)
setstage (35)
kmyQuest.pTG05MercerFG = 1
kmyQuest.pTG05MercerFG02 = 1
game.GetPlayer().AddItem(kmyQuest.pTG05Lockpicks,10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  

Idle Property pGetUp  Auto  

TG05QuestScript Property pTG05QS  Auto  

ImageSpaceModifier Property pimodWakeUp  Auto  

ObjectReference Property pTG05LastTrigger  Auto  

LeveledItem Property pTG05Reward  Auto  

ObjectReference Property pSnowVeilSanctumMapMarker  Auto  

ObjectReference Property pTG05LockedDoorPiece  Auto  

ActorBase Property pMercerBase  Auto  

ObjectReference Property pTG05CampEnableMarker  Auto  

ObjectReference Property pTG05KarliahVanishAudio  Auto  

ObjectReference Property pTG05MercerStabAudio  Auto  

ObjectReference Property pTG05TransitionAudio  Auto  

ObjectReference Property pTG05ArrowHitRef  Auto  
