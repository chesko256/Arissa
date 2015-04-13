;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname QF_TG00_00021556 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG00HoldingSafe
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00HoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00RingAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00RingAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrandSheiAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BrandSheiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00PlayerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_TG00City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MadesiAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MadesiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00MadesiChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00MadesiChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Success
if kmyQuest.pTG00ArrestStopper == 0
kmyQuest.pTG00SPArrest.Start()
endif
if pTG00SPQuest.GetStage() < 200
pTG00SPQuest.SetStage(200)
endif
completeallobjectives()
unregisterforupdate()
Game.GetPlayer().RemovePerk(pTG00PickpocketHelper)
pBrynjolf.SetInvulnerable(false)
kmyQuest.pTG01.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Player Quest Failed Stage
kmyQuest.pTG00SP.setstage (20)
kmyQuest.pTGFailure.Value = ( kmyQuest.pTGFailure.Value + 1 )
kmyQuest.pTG00ArrestStopper = 1 
if IsObjectiveDisplayed(10) == 1
SetObjectiveFailed (10,1)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveFailed (20,1)
endif
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Player refused quest, Brynjolf waits for return
kmyQuest.pTG00MiscHandler.Start()
if pTG00MaulHandler.GetStage() == 10
pTG00MaulHandler.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Start Scene in TG00SP
Game.GetPlayer().AddPerk(pTG00PickpocketHelper)
Alias_BrynjolfAlias.GetActorRef().SetNotShowOnStealthMeter(true)
pTG00QS.SetupTimer()
RegisterForUpdate(30)
SetObjectiveCompleted (8, 1)
SetObjectiveDisplayed (10, 1)
pTG00Brandshei.SetEssential(false)
pTG00Madesi.SetEssential(false)
kmyQuest.pTG00SP.Start()
Alias_TG00MadesiChest.GetRef().Additem(Alias_TG00RingAlias.GetRef())
; Debug.Trace("TG00 Test CWOwner Keyword for Location " + Alias_TG00City.GetLocation() + " CWOwner: " + Alias_TG00City.GetLocation().GetKeywordData(kmyQuest.pTG00CWOwner))
if Alias_TG00City.GetLocation().GetKeywordData(kmyQuest.pTG00CWOwner) == 1
;Imperials
; Debug.Trace("TG00 Imperials trying to enable " + kmyQuest.pTG00GuardImperial)
kmyQuest.pTG00GuardImperial.Enable()
else
;Stormcloaks
; Debug.Trace("TG00 Stormcloak trying to enable " + kmyQuest.pTG00GuardStormcloak)
kmyQuest.pTG00GuardStormcloak.Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Player Failed, Left Area/Waited Too Long
kmyQuest.pTG00SP.setstage (20)
kmyQuest.pTGFailure.Value = ( kmyQuest.pTGFailure.Value + 1 )
kmyQuest.pTG00ArrestStopper = 1 
if IsObjectiveDisplayed(10) == 1
SetObjectiveFailed (10,1)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveFailed (20,1)
endif
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has obtained the ring
SetObjectiveCompleted (10, 1)
SetObjectiveDisplayed (20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;No debug needed to Start this quest - ready at game start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Waiting for Player to begin the scene
SetObjectiveDisplayed (8, 1)
kmyQuest.pTG00MiscHandler.Setstage(200)
if pTG00MaulHandler.GetStage() == 10
pTG00MaulHandler.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG00QuestScript
Quest __temp = self as Quest
TG00QuestScript kmyQuest = __temp as TG00QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has reverse pickpocketed the ring
Alias_BrandSheiAlias.GetActorRef().RemoveItem(pRing,1)
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
kmyQuest.pTG00SP.setstage (20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00MaulHandler  Auto  
ActorBase Property pTG00Brandshei  Auto  
ActorBase Property pTG00Madesi  Auto  
Armor Property pRing  Auto  
Quest Property pTG00SPQuest  Auto

TG00QuestScript Property pTG00QS  Auto  

Perk Property pTG00Pickpockethelper  Auto  

ActorBase Property pBrynjolf  Auto  
