;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_TG02_0002154E Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG02ApiaryMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02ApiaryMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02AringothSafeKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02AringothSafeKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02Aringoth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02Aringoth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02MercerFrey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02MercerFrey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02Brynjolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02Brynjolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02VexTunnelMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02VexTunnelMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02BillofSaleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02BillofSaleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02AringothsSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02AringothsSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02Vex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02Vex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02GoldenglowEstateEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02GoldenglowEstateEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02BeeHiveReinforcementsEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02BeeHiveReinforcementsEnabler Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Listen to Mercer's speech and get first assignment.
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;Crime Toggle for Rift Hold (Guild Benefit)
;Cache Toggle for Riften (Guild Benefit)
kmyQuest.pRiften.Value = 1
pRiftenCacheEnabler.Enable()
pTGStatusQuest.Start()
pTGMapMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;StartUp the TG02B Quest to Ungate the Radiant Quests
kmyQuest.pTG02BQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Vex's advice added
SetObjectiveDisplayed(45,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
unregisterforupdate()
kmyQuest.pTG03Quest.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest basics given, speak to Brynjolf for the meat and potatoes
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
kmyQuest.pTG02BrynjolfMove = 3
Alias_TG02MercerFrey.GetActorRef().EvaluatePackage()
Alias_TG02Brynjolf.GetActorRef().EvaluatePackage()
Alias_TG02GoldenglowEstateEnabler.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Brynjolf and Player begin Intro Scene
kmyQuest.pTG02IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Follow Brynjolf to Meet Mercer
pInsideFlagonDoorSwapper.Enable()
pOutsideFlagonDoorSwapper.Enable()
Game.GetPlayer().AddToFaction(kmyQuest.pTG02TGFaction)
Alias_TG02MercerFrey.GetActorRef().moveto(pTG02MercerStartMarker)
kmyQuest.pTG02GuildDoor.Lock(false)
SetObjectiveDisplayed (10,1)
kmyQuest.pTG02BrynjolfMove = 1
Alias_TG02Brynjolf.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
pTG00Quest.SetStage(200)
pTG01Quest.SetStage(200)
Alias_TG02Brynjolf.GetActorRef().moveto(pTG02BrynjolfStartMarker)
setstage (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Goldenglow assignment formally given
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
SetObjectiveDisplayed (50,1)
pGoldenglowMapMarkerRef.AddToMap()
RegisterforSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG02QuestScript
Quest __temp = self as Quest
TG02QuestScript kmyQuest = __temp as TG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Player completed everything at Goldenglow and is to speak to Brynjolf
SetObjectiveDisplayed (60,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto
Quest Property pTG01Quest  Auto

ObjectReference Property pTG02BrynjolfStartMarker  Auto  

ObjectReference Property pTG02MercerStartMarker  Auto  

ObjectReference Property pGoldenglowMapMarkerRef  Auto  

ObjectReference Property pRiftenCacheEnabler  Auto  

Quest Property pTGStatusQuest  Auto  

ObjectReference Property pInsideFlagonDoorSwapper  Auto  

ObjectReference Property pOutsideFlagonDoorSwapper  Auto  

ObjectReference Property pTGMapMarker  Auto  
