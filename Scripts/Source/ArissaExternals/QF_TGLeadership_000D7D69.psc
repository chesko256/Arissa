;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_TGLeadership_000D7D69 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGLeadershipKarliah
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipKarliah Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipVipir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipVipir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipVex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipVex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipRavyn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipRavyn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipPlayerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipPlayerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipSapphireAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipSapphireAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeaderShipDelvin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeaderShipDelvin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipBrynjolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipBrynjolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipNiruin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipNiruin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipGarthar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipGarthar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipEtienne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipEtienne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipTonilia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipTonilia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipCynricAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipCynricAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipRuneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipRuneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipThrynnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipThrynnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLeadershipMaven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLeadershipMaven Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Post Scene Handler
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
RegisterforSingleUpdate(1)
Game.GetPlayer().ModFactionRank(pThievesGuild,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;Brynjolf Tells Player to Meet in center of Cistern - Move all NPC's into position
Alias_TGLeadershipBrynjolf.GetActorRef().EvaluatePackage()
Alias_TGLeadershipKarliah.GetActorRef().Moveto(pTGLMarkKarliah)
Alias_TGLeadershipMaven.GetActorRef().Moveto(pTGLMarkMaven)
Alias_TGLeadershipVex.GetActorRef().Moveto(pTGLMarkVex)
Alias_TGLeadershipDelvin.GetActorRef().Moveto(pTGLMarkDelv)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the Scene when Player hits the trigger
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
pTGLScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player got Armor
SetObjectiveCompleted(50,1)
Game.GetPlayer().AddItem(pArmorLeadHead,1)
Game.GetPlayer().AddItem(pArmorLeadBody,1)
Game.GetPlayer().AddItem(pArmorLeadHands,1)
Game.GetPlayer().AddItem(pArmorLeadFeet,1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player speak to Tonilia
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
Game.GetPlayer().AddItem(pAmuletofArticulation)
Game.GetPlayer().AddItem(pTributeKey,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Tester
pTG00Quest.Setstage(200)
pTG01Quest.Setstage(200)
pTG02Quest.Setstage(200)
Alias_TGLeadershipRavyn.GetActorRef().Enable()
Alias_TGLeadershipGarthar.GetActorRef().Enable()
Alias_TGLeadershipKarliah.GetActorRef().Enable()
Alias_TGLeadershipBrynjolf.GetActorRef().Moveto(pTGLMarkBryn)
Game.GetPlayer().AddToFaction(pTGFaction)
pDoor.Lock(false)
pMercer.Disable()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;Initiate Dialogue for all TG NPC's and StartUp Brynjolf's Dialogue
SetObjectiveDisplayed(10,1)
Alias_TGLeadershipMaven.GetActorRef().AddToFaction(pThievesGuild)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;Completed Leadership Scene and Player left the cell
Alias_TGLeadershipKarliah.GetActorRef().Moveto(kmyQuest.pKarliahMarker)
Alias_TGLeadershipMaven.GetActorRef().Moveto(kmyQuest.pMavenMarker)
Alias_TGLeadershipMaven.GetActorRef().RemoveFromFaction(pThievesGuild)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TGLeadershipQuestScript
Quest __temp = self as Quest
TGLeadershipQuestScript kmyQuest = __temp as TGLeadershipQuestScript
;END AUTOCAST
;BEGIN CODE
;EndQuest
Game.AddAchievement(17)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pTGLScene  Auto  

Faction Property pTGFaction  Auto  

ObjectReference Property pDoor  Auto  

ObjectReference Property pTGLMarkVex  Auto  

ObjectReference Property pTGLMarkDelv  Auto  

ObjectReference Property pTGLMarkKarliah  Auto  

ObjectReference Property pTGLMarkMaven  Auto  

ObjectReference Property pTGLMarkBryn  Auto  

ObjectReference Property pMercer  Auto  

Quest Property pTGLQuest  Auto  

Armor Property pArmorLeadHead  Auto  

Armor Property pArmorLeadBody  Auto  

Armor Property pArmorLeadHands  Auto  

Armor Property pArmorLeadFeet  Auto  

Quest Property pTG00Quest  Auto  

Quest Property pTG01Quest  Auto  

Quest Property pTG02Quest  Auto  

Faction Property pThievesGuild  Auto

LeveledItem Property pAmuletofArticulation  Auto  

Key Property pTributeKey  Auto  
