;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 54
Scriptname QF_TG08A_00057F99 Extends Quest Hidden

;BEGIN ALIAS PROPERTY secretDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_secretDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NGArmorBootsAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NGArmorBootsAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerFloorGlyphAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerFloorGlyphAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG08AHoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08AHoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NGArmorHelmetAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NGArmorHelmetAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NGArmorSuitAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NGArmorSuitAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NocturnalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NocturnalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG08AArmorStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08AArmorStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NGArmorGlovesAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NGArmorGlovesAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NocturnalOriginAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NocturnalOriginAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG08ADoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG08ADoorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Trigger tripped for Scene Start
kmyQuest.pTG08AGuildScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
completeallobjectives()
pTGKeyQuest.Setstage(10)
kmyQuest.pTG08BQuest.SetStage(10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Karliah done speaking, switch to Brynjolf
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Player is to meet Karliah and Brynjolf outside Nightingale Hall
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_TG08ADoorAlias.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Pre-Oath Scene complete... need to move to Circle
SetObjectiveCompleted(45,1)
SetObjectiveDisplayed(50,1)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Gate Unlocked, Proceed Into Oath Chamber
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Player is headed to Speak to Karliah
SetObjectiveDisplayed(10,1)
RegisterforSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Player has equipped armor, Pre-Oath Scene Primed
SetObjectiveCompleted(42,1)
SetObjectiveDisplayed(45,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Oath Scene is Over - Player needs to Speak to Karliah
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Pre-Oath Scene Conclusion, Question to Player
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
kmyQuest.pTG08AKarliahFG03 = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;When Bryn and Karliah arrive at armor, suit up and move to next position
Alias_KarliahAlias.GetActorRef().SetOutfit(kmyQuest.pTG08ANGaleOutfit,false)
Alias_BrynjolfAlias.GetActorRef().SetOutfit(kmyQuest.pTG08ANGaleOutfit,false)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
pTG08AQS.TG08AArmoredReady()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Hall Scene Done, Player needs to Equip Nightingale Armor
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin Oath Scene Sequence
SetObjectiveCompleted(50,1)
Game.DisablePlayerControls(true,true,true,false,true)
kmyQuest.pTG08AOathScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Player Left the Cell, Move Karliah and Brynjolf
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Player met with Karliah and Brynjolf - Karliah begins Escort
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
UnregisterForUpdate()
Alias_SecretDoor.getReference().activate(Alias_SecretDoor.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest startup
pTG00Quest.Stop()
Alias_KarliahAlias.GetActorRef().Enable()
Alias_BrynjolfAlias.GetActorRef().moveto(pTG08ABrynjolfGuildStart)
Alias_KarliahAlias.GetActorRef().moveto(pTG08AKarliahGuildStart)
Game.GetPlayer().AddToFaction(kmyQuest.pTG08ATGFaction)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin Hall Scene Sequence
kmyQuest.pTG08AHallScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE TG08AQuestScript
Quest __temp = self as Quest
TG08AQuestScript kmyQuest = __temp as TG08AQuestScript
;END AUTOCAST
;BEGIN CODE
;End Oath Scene and Restore
Game.EnablePlayerControls(true,true,true,true,true)
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  
ActorBase Property pTG08MercerFrey  Auto  
ObjectReference Property pTG08AKarliahGuildStart  Auto  
ObjectReference Property pTG08ABrynjolfGuildStart  Auto  

TG08AQuestScript Property pTG08AQS  Auto  

Quest Property pTGKeyQuest  Auto  
