;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 39
Scriptname QF_TG08_00021554 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG08BExitMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08BExitMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MercerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG08MeetMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08MeetMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkeletonKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkeletonKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MercerSpeakerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercerSpeakerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG08BIrkDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08BIrkDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Fight scene finished
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest Start
pTG00Quest.Stop()
pTGLarceny.Start()
pKeyQuest.SetStage(10)
Alias_KarliahAlias.GetActorRef().Enable()
Game.GetPlayer().AddToFaction(kmyQuest.pTG08BTGFaction)
Alias_BrynjolfAlias.GetActorRef().moveto(kmyQuest.pTG08BBrynjolfStarterMarker)
Alias_KarliahAlias.GetActorRef().moveto(kmyQuest.pTG08BKarliahStarterMarker)
Alias_KarliahAlias.GetActorRef().SetOutfit(kmyQuest.pTG08BNGaleOutfit,false)
Alias_BrynjolfAlias.GetActorRef().SetOutfit(kmyQuest.pTG08BNGaleOutfit,false)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Karliah's Follow is Restored
Alias_KarliahAlias.GetActorRef().SetPlayerTeammate(abCanDoFavor=false)
Alias_BrynjolfAlias.GetActorRef().SetPlayerTeammate(abCanDoFavor=false)
kmyQuest.pTG08BKarliahAccompany = 0
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;flood scene over
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Mercer Fight starts
kmyQuest.TG08Bfight.start()
Game.EnablePlayerControls(true,true,true,true,true,true,true,true)
Game.SetInChargen(false, false, false)
kmyQuest.pTG08BMercer.SetEssential(false)
kmyQuest.TG08BFightControllerRef.Activate(kmyQuest.TG08BFightControllerRef)
Alias_MercerAlias.GetActorRef().EvaluatePackage()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
kmyQuest.pTG08BMonsterDisablerRef.Enable()
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player is safe in upper cave... speak to Karliah
SetObjectiveCompleted (50,1)
SetObjectiveDisplayed (60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Mercer is dead!
SetObjectiveCompleted (40,1)
SetObjectiveDisplayed (45,1)
alias_MercerAlias.getReference().placeAtMe(kmyQuest.TG08BShockwaveExplosion)
utility.wait(0.5)
kmyQuest.pTG08BRisingWaterRef.Activate(kmyQuest.pTG08BRisingWaterRef)
kmyQuest.pTG08BFloodScene01.Start()
;alias_BrynjolfAlias.getActorRef().dispelSpell(kmyQuest.TG08BSubterfugeExplosionEffect)
kmyQuest.pTG08BBrynjolfIsCharmed = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Player has hit Encounter Trigger 01
Alias_KarliahAlias.GetActorRef().SetPlayerTeammate(false)
Alias_BrynjolfAlias.GetActorRef().SetPlayerTeammate(false)
Game.DisablePlayerControls(true,true,true,false,true,true,true,false)
Game.SetInChargen(true, true, false)
alias_karliahAlias.getReference().moveTo(kmyQuest.pTG08BKarliahFightMarker)
alias_brynjolfAlias.getReference().moveTo(kmyQuest.pTG08BBrynjolfFightMarker)
kmyQuest.pTG08BFinalScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Player has told Karliah to cease her follow
Alias_KarliahAlias.GetActorRef().SetPlayerTeammate(false)
Alias_BrynjolfAlias.GetActorRef().SetPlayerTeammate(false)
RegisterForUpdate(5)
kmyQuest.pTG08BKarliahAccompany = 1
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Final Fight with Mercer and Ending Debug Stage
Alias_KarliahAlias.GetActorRef().Enable()
Actor Mercer = Alias_MercerAlias.GetReference() as Actor
Mercer.RemoveFromAllFactions()
kmyQuest.pTG08BMonsterDisablerRef.Enable()
kmyQuest.pTG08bScene02Done = 1
setstage(30)
Alias_KarliahAlias.GetActorRef().SetOutfit(kmyQuest.pTG08BNGaleOutfit,false)
Alias_BrynjolfAlias.GetActorRef().SetOutfit(kmyQuest.pTG08BNGaleOutfit,false)
Alias_MercerAlias.GetActorRef().moveto(pTG08BMercerDebugFinalStart)
Alias_BrynjolfAlias.GetActorRef().moveto(pTG08BBrynjolfDebugFinalStart)
Alias_KarliahAlias.GetActorRef().moveto(pTG08BKarliahDebugFinalStart)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
Alias_MercerAlias.GetActorRef().EvaluatePackage()
Game.GetPlayer().moveto(pTG08BPlayerDebugFinalStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;The Fight Intro with the first earthquake has ended
kmyQuest.pTG08BRisingWaterRef.Activate(kmyQuest.pTG08BRisingWaterRef)
utility.wait(2.0)
Alias_MercerAlias.GetActorRef().EvaluatePackage()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Skeleton Key has been obtained, need to escape dungeon as it floods
Game.GetPlayer().AddPerk(pSkeletonKeyPerk)
SetObjectiveCompleted (45,1)
SetObjectiveDisplayed (50,1)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().AddItem(pTG08Reward,1)
kmyQuest.pTG09Quest.setstage (10)
pTG08BBronzewaterResetMarker.disable()
Alias_KarliahAlias.GetActorRef().RemoveItem(pNightingaleBowNPC,1)
pBronzewaterLocation.clear()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Player is en route to Irkngthand
pIrkngthandMapMarkerRef.AddToMap()
SetObjectiveDisplayed (10,1)
Alias_MercerAlias.GetActorRef().Disable()
Alias_MercerAlias.GetActorRef().moveto(pTG08MercerStart)
Actor Mercer = Alias_MercerAlias.GetReference() as Actor
Mercer.RemoveFromAllFactions()
Alias_MercerAlias.GetActorRef().AddItem(Alias_SkeletonKeyAlias.GetRef())
Alias_MercerAlias.GetActorRef().AddItem(pTGLarcenyEye.GetRef())
Alias_MercerAlias.GetActorRef().SetOutfit(pMercerFreyKillOutfit,false)
kmyQuest.pTG08BMonsterDisablerRef.Disable()
RegisterForSingleUpdate(1)
kmyQuest.pTG08BridgeEnableRef.enable()
kmyQuest.pTG08bIrkngthandLockedDoorRef.lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has entered dungeon, now needs to locate and speak to Karliah
Alias_BrynjolfAlias.GetActorRef().moveto(pTG08BrynjolfStart)
Alias_KarliahAlias.GetActorRef().moveto(pTG08KarliahStart)
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG08BQuestScript
Quest __temp = self as Quest
TG08BQuestScript kmyQuest = __temp as TG08BQuestScript
;END AUTOCAST
;BEGIN CODE
;Player spoke to Karliah and is now leading the group into the dungeon
Alias_KarliahAlias.GetActorRef().SetPlayerTeammate(abCanDoFavor=false)
Alias_BrynjolfAlias.GetActorRef().SetPlayerTeammate(abCanDoFavor=false)
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
UnregisterForUpdate()

if kmyQuest.pTG08BKarliahFG01 == 0
kmyQuest.pTG08BKarliahFG01 = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  
ObjectReference Property pTG08BrynjolfStart  Auto
ObjectReference Property pTG08KarliahStart  Auto

ObjectReference Property pTG08MercerStart  Auto  

ActorBase Property pTG08MercerFrey  Auto  

objectreference Property pTG08BKarliahDebugFinalStart  Auto  

objectreference Property pTG08BBrynjolfDebugFinalStart  Auto  

objectreference Property pTG08BPlayerDebugFinalStart  Auto  

objectreference Property pTG08BMercerDebugFinalStart  Auto  

LeveledItem Property pTG08Reward  Auto  

Quest Property pKeyQuest  Auto  

ReferenceAlias Property pTG08BEye  Auto  

Quest Property pTGLarceny  Auto  

ObjectReference Property pIrkngthandMapMarkerRef  Auto  

Outfit Property pMercerFreyKillOutfit  Auto  

Perk Property pSkeletonKeyPerk  Auto  

ObjectReference Property pTG08BBronzewaterResetMarker  Auto  

LocationAlias Property pBronzewaterLocation  Auto  

Weapon Property pNightingaleBowNPC  Auto  

ReferenceAlias Property pTGLarcenyEye  Auto  
