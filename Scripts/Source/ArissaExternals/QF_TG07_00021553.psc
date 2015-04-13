;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_TG07_00021553 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG07RavynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07RavynAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07SapphireAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07SapphireAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MercerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07VipirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07VipirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07NiruinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07NiruinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07RuneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07RuneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07CynricAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07CynricAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07RampMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07RampMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07KarliahMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07KarliahMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalmerPlansAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalmerPlansAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValdAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValdAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07ThrynnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07ThrynnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07MavenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07MavenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07BackDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07BackDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG07GartharAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG07GartharAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DelvinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DelvinAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;StartUp FreeformValdDebt
if pTG07Quest.IsObjectiveDisplayed(42) == 1
pTG07Quest.SetObjectiveCompleted(42,1)
endif
pFVDQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Vald Option Branch Reward
Game.GetPlayer().AddItem(kmyQuest.pTG07Key,1)
if Game.GetPlayer().GetItemCount(pDebt) >= 1
Game.GetPlayer().RemoveItem(pFVDDebt.GetRef())
endif
Alias_ValdAlias.GetActorRef().RemoveItem(kmyQuest.pTG07Key,1)
Alias_ValdAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Pointed at Vex for help on Vald
SetObjectiveDisplayed (42,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has hit scene trigger
kmyQuest.pTG07SPQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is inside Mercer's House... start looking for clues
SetObjectiveCompleted (40,1)
SetObjectiveDisplayed (50,1)
if IsObjectiveCompleted(42) == 0
SetObjectiveDisplayed (42,0)
endif
if IsObjectiveCompleted(45) == 0
SetObjectiveDisplayed (45,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Infiltrate Mercer's House (Enter Cell)
pExteriorRatwayDoor.Lock(false)
pExteriorRatwayDoor.SetLockLevel(0)
pInteriorRatwayDoor.Lock(false)
pInteriorRatwayDoor.SetLockLevel(0)
Alias_ValdAlias.GetActorRef().Enable()
kmyQuest.pTG07ValdEnabler.Enable()
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
completeallobjectives()
Alias_BrynjolfAlias.GetActorReference().ModFavorPoints(kmyQuest.pTGFavorLarge.GetValueInt())
kmyQuest.pTG08AQuest.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Player discovered plans, Return to Brynjolf
SetObjectiveCompleted (50,1)
SetObjectiveDisplayed (60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Scenes Done, Speak to Brynjolf
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed (10,1)
pTG07IdleSwapper.Enable()
pExteriorRatwayDoor.Lock()
pExteriorRatwayDoor.SetLockLevel(255)
pInteriorRatwayDoor.Lock()
pInteriorRatwayDoor.SetLockLevel(255)
Alias_KarliahAlias.GetActorRef().Enable()
Alias_MercerAlias.GetActorRef().Disable()
Alias_BrynjolfAlias.GetActorRef().moveto(kmyQuest.pTG07BrynjolfStartMarker)
Alias_DelvinAlias.GetActorRef().moveto(kmyQuest.pTG07DelvinStartMarker)
Alias_VexAlias.GetActorRef().moveto(kmyQuest.pTG07VexStartMarker)
pTG07Trigger.Enable()
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
pTG00Quest.Stop()
Game.GetPlayer().AddToFaction(kmyQuest.pTG07TGFaction)
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Vald Left
Alias_ValdAlias.GetActorRef().Disable()
pFVDQuest.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TG07QuestScript
Quest __temp = self as Quest
TG07QuestScript kmyQuest = __temp as TG07QuestScript
;END AUTOCAST
;BEGIN CODE
;Player Should Follow Karliah
pWinterholdEnabler.Disable()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  
ObjectReference Property pTG07Trigger  Auto

ReferenceAlias Property pFVDDebt  Auto  

Quest Property pFVDQuest  Auto  

Book Property pDebt  Auto  

Quest Property pTG07Quest  Auto  

ObjectReference Property pWinterholdEnabler  Auto  

ObjectReference Property pExteriorRatwayDoor  Auto  

ObjectReference Property pTG07IdleSwapper  Auto  

ObjectReference Property pInteriorRatwayDoor  Auto  
