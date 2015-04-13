;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_TG06_00021552 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EnthirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnthirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06Breadcrumb01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06Breadcrumb01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalcelmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalcelmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06WaterfallBreadcrumb
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06WaterfallBreadcrumb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06Breadcrumb03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06Breadcrumb03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TranslationStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TranslationStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06RubbingAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06RubbingAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06MuseumKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06MuseumKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG06Breadcrumb02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG06Breadcrumb02Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has to gain access to the Museum
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (25,1)
if (Game.GetPlayer().GetItemCount(MuseumKey) == 0)
   SetObjectiveDisplayed (27,1)
EndIf
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Rubbing obtained, Return to Enthir for translation
if IsObjectiveDisplayed(30) == 1
SetObjectiveCompleted(30,1)
endif
SetObjectiveCompleted (40,1)
SetObjectiveDisplayed (50,1)
Alias_TG06RubbingAlias.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_TG06RubbingAlias.GetRef())
Alias_KarliahAlias.GetActorRef().Enable()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
Alias_EnthirAlias.GetActorRef().EvaluatePackage()
;Trigger ambush scene in dunMarkarthWizardsQuartersQST
dunMWQQST.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Used to Trigger Calcelmo's Translation scene with Enthir
Game.GetPlayer().RemoveItem(Alias_TG06RubbingAlias.GetRef())
kmyQuest.pTG06TransScene.Start()
Alias_EnthirAlias.GetActorRef().EvaluatePackage()
Alias_KarliahAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Player has obtained the key.
SetObjectiveCompleted(27,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is directed to speak to Calcelmo
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
Alias_KarliahAlias.GetActorRef().Disable()
Alias_KarliahAlias.GetActorRef().MoveTo(kmyQuest.pTG06KarliahWHMarker)
Alias_TG06MuseumKey.GetReference().Enable()

;Set up Markarth Wizards' Quarters for TG06 events.
dunMWQQST.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Speak to Karliah
SetObjectiveCompleted (60,1)
SetObjectiveDisplayed (70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to sneak into Calcelmo's Wizard tower and steal the Translation
SetObjectiveCompleted (25,1)
SetObjectiveDisplayed (30,1)
if IsObjectiveDisplayed(27) == 1
SetObjectiveCompleted (27,1)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed (20,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
completeallobjectives()
Alias_BrynjolfAlias.GetActorRef().Enable()
Game.GetPlayer().AddItem(pTG06Reward,1)
kmyQuest.pTG07.setstage (10)
pTGKarliah.setstage (10)
pTGFencesQuest.SetStage(30)
;Set Markarth Wizards' Quarters to post-quest state.
dunMWQQST.SetStage(100)
;73466 Clearing the quest item flag on Gallus's Pre-Encoded Journal if no longer needed
pJournalAlias.Clear()
; end 73466
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Speak to Enthir
SetObjectiveCompleted (50,1)
SetObjectiveDisplayed (60,1)
RegisterforUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Player revelation that translation is huge stone - need to make a rubbing instead
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is to speak to Enthir at College of WH
pWinterholdEnabler.Enable()
SetObjectiveDisplayed (10,1)
Alias_EnthirAlias.GetActorRef().moveto(kmyQuest.pTG06EnthirArrivalMarker)
Alias_KarliahAlias.GetActorRef().RemoveSpell(TG05KarliahInvisibilitySpell)
Alias_TG06RubbingAlias.GetRef().Disable()
Alias_BrynjolfAlias.GetActorRef().Disable()
;Set up Markarth Wizards' Quarters for pre-TG06 events.
dunMWQQST.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG06QuestScript
Quest __temp = self as Quest
TG06QuestScript kmyQuest = __temp as TG06QuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest Setup Stage
pTG00Quest.Stop()
Alias_KarliahAlias.GetActorRef().Enable()
Alias_KarliahAlias.GetActorRef().MoveTo(kmyQuest.pTG06KarliahStartMarker)
Game.GetPlayer().AddToFaction(kmyQuest.pTG06TGFaction)
setstage (10)
kmyQuest.pTGKDQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  

Quest Property dunMWQQST  Auto  

Quest Property pTGKarliah  Auto  

Key Property MuseumKey  Auto  

LeveledItem Property pTG06Reward  Auto  

Quest Property pTGFencesQuest  Auto  

ObjectReference Property pWinterholdEnabler  Auto  

ReferenceAlias Property pJournalAlias  Auto  

Spell Property TG05KarliahInvisibilitySpell Auto