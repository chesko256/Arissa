;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_TG09_00021555 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG09Circle02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09Circle02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09NystromsCorpseAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09NystromsCorpseAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NocturnalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NocturnalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09SkeletonKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09SkeletonKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09Circle01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09Circle01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09EbonmereLockAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09EbonmereLockAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09Circle03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09Circle03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09GallusStartMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09GallusStartMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09NystromsJournalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09NystromsJournalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Animation Controller Stage
Game.GetPlayer().RemovePerk(pTGSkeletonKeyPerk)
pPool.PlayAnimation("open")
utility.Wait(1)
pTG09imod.applyCrossfade(1.0)
setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to speak to Karliah
SetObjectiveCompleted (50,1)
SetObjectiveDisplayed (60,1)
imageSpaceModifier.removeCrossfade(1.0)
Utility.Wait(5)
pTG09Nocturnal.Disable()
Alias_GallusAlias.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is seeking the Twilight Sepulcher
SetObjectiveDisplayed (10,1)
pTwilightSepulcherMapMarker.AddToMap()
kmyQuest.pTG09Door.Lock(false)
RegisterforSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
Game.EnablePlayerControls()
pTGNightingaleBeds.Enable()
pTG09ShrineEnabler.Enable()
pTG09ExitEnabler.Enable()
game.GetPlayer().Addperk(TGNightingaleShadowPerk)
Game.IncrementStat( "Questlines Completed" )
pTGKeyQuest.SetStage(200)
UnregisterforUpdate()
completeallobjectives()
Game.AddAchievement(16)
kmyQuest.pTG09PostQuest.SetStage(10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to chose a Nightingale Ability
SetObjectiveCompleted (60,1)
SetObjectiveDisplayed (70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is to follow the Pilgrim's Path
Alias_NocturnalAlias.GetActorRef().Enable()
pBlockerDoor.PlayAnimation("Open")
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
Alias_BrynjolfAlias.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has entered the Inner Sanctum - Place the Key in the Lock
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
pTG00Quest.Stop()
pKeyQuest.SetStage(10)
Game.GetPlayer().AddItem(Alias_TG09SkeletonKeyAlias.GetRef())
Game.GetPlayer().AddToFaction(kmyQuest.pTG09TGFaction)
Alias_TG09KarliahAlias.GetActorRef().Enable()
Alias_BrynjolfAlias.GetActorRef().moveto(kmyQuest.pTG09BrynjolfBronzeWaterMarker)
Alias_TG09KarliahAlias.GetActorRef().moveto(kmyQuest.pTG09KarliahBronzeWaterMarker)
Alias_TG09KarliahAlias.GetActorRef().SetOutfit(kmyQuest.pTG09NGOutfit,false)
Alias_BrynjolfAlias.GetActorRef().SetOutfit(kmyQuest.pTG09NGOutfit,false)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to Listen to Nocturnal's Speech
Game.DisablePlayerControls(false,true,false,false,true,false,false,false)
SetObjectiveCompleted (40,1)
SetObjectiveDisplayed (50,1)
Alias_TG09KarliahAlias.GetActorRef().Enable()
pNocturnalBirdLeft.Play(Alias_NocturnalAlias.GetActorRef(),-1)
pNocturnalBirdRight.Play(Alias_NocturnalAlias.GetActorRef(),-1)
pTG09BirdsUp.PlayAnimation("playanim01")
Utility.Wait(1)
kmyQuest.pTG09NocturnalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG09QuestScript
Quest __temp = self as Quest
TG09QuestScript kmyQuest = __temp as TG09QuestScript
;END AUTOCAST
;BEGIN CODE
;Gallus's Spirit approaching Player, Speak to Gallus
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;Alias_TG09KarliahAlias.GetActorRef().SetOutfit(kmyQuest.pTG09KarliahOutfit,false)
Alias_BrynjolfAlias.GetActorRef().SetOutfit(kmyQuest.pTG09BrynOutfit,false)
Alias_TG09KarliahAlias.GetActorRef().Disable()
Alias_TG09KarliahAlias.GetActorRef().moveto(kmyQuest.pTG09KarliahStartMarker)
Alias_BrynjolfAlias.GetActorRef().Disable()
Alias_BrynjolfAlias.GetActorRef().moveto(kmyQuest.pTG09BrynTGMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  
ObjectReference Property pTG09Nocturnal  Auto  


TGRShellScript Property pTGRShellScript  Auto  

ObjectReference Property pPool  Auto  

ObjectReference Property pBlockerDoor  Auto  

Quest Property pTGKeyQuest  Auto  

Quest Property pKeyQuest  Auto  

ObjectReference Property pTwilightSepulcherMapMarker  Auto  

Idle Property pRise  Auto  

Idle Property pExit  Auto  

VisualEffect Property pNocturnalBirdLeft  Auto  

VisualEffect Property pNocturnalBirdRight  Auto  

ObjectReference Property pTG09BirdsUp  Auto  

ObjectReference Property pTG09BirdsDown  Auto  

ImageSpaceModifier Property pTG09imod  Auto  

ObjectReference Property pTG09ExitEnabler  Auto  

ObjectReference Property pTG09ShrineEnabler  Auto  

Perk Property pTGSkeletonKeyPerk  Auto  

Perk Property TGNightingaleShadowPerk  Auto  

ObjectReference Property pTGNightingaleBeds  Auto  
