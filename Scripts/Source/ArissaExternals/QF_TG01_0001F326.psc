;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 38
Scriptname QF_TG01_0001F326 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SvanaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SvanaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrifaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrifaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BersiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BersiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG01TalenJeiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG01TalenJeiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VekelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VekelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaelgaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaelgaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG01HaelgaStatueAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG01HaelgaStatueAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeeravaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeeravaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG01PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG01PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrynjolfMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrynjolfMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DirgeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DirgeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG01UrnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG01UrnAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is finding the Ragged Flagon
if TG00SP.IsRunning() == 1
TG00SP.Stop()
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
endif
SetObjectiveDisplayed (10,1)
kmyQuest.pDRQS.pDia04 = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Keerava Slain
kmyQuest.pTG01GotCash += 1
kmyQuest.pTG01QuestFail += 1
SetObjectiveCompleted (20, 1)
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player located Brynjolf and has been assigned the protection payments sub-quest
SetObjectiveCompleted (10, 1)
SetObjectiveDisplayed (20,1)
SetObjectiveDisplayed (30,1)
SetObjectiveDisplayed (40,1)
pTG01HaelgaStatueRef.Enable()
pTG01UrnRef.Enable()
pBersi.SetEssential(false)
pHaelga.SetEssential(false)
pKeerava.SetEssential(false)
pRiftenPawnedPrawn.SetPublic(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Bersi Slain
SetObjectiveCompleted (30, 1)
kmyQuest.pTG01GotCash += 1
kmyQuest.pTG01QuestFail += 1
pTG01QS.pTG01BersiHandled = 1
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Tavern Scene Done!
Alias_BrynjolfAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player recieved payment from Haelga
SetObjectiveCompleted (40, 1)
if IsObjectiveDisplayed(41) == 1
SetObjectiveDisplayed (41, 0)
endif
kmyQuest.pTG01GotCash += 1
if game.getplayer().getitemcount(kmyQuest.pTG01HaelgaStatue) >= 1
game.getplayer().removeitem(kmyQuest.pTG01HaelgaStatue)
kmyquest.pTG01GotStatue = 2
endif
game.getplayer().additem(kmyQuest.pTG01Gold,kmyQuest.pTG01HaelgaGold)
pTG01QS.pTG01HaelgaPaid = 1
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Haelga Slain
SetObjectiveCompleted (40, 1)
kmyQuest.pTG01GotCash += 1
kmyQuest.pTG01QuestFail += 1
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player recieved payment from Bersi
SetObjectiveCompleted (30, 1)
if IsObjectiveDisplayed(31) == 1
SetObjectiveDisplayed (31, 0)
endif
kmyQuest.pTG01GotCash += 1
game.getplayer().additem(kmyQuest.pTG01Gold,kmyQuest.pTG01BersiGold)
Alias_DrifaAlias.GetActorRef().EvaluatePackage()
pTG01QS.pTG01BersiPaid = 1
pTG01QS.pTG01BersiHandled = 1
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has obtained all payments and should return to Brynjolf for the reward
SetObjectiveDisplayed (50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest Start
setstage (10)
pTG00Quest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.pTG01DoorBeforeOutside.Disable()
kmyQuest.pTG01DoorBeforeInside.Disable()
kmyQuest.pTG01DoorAfterOutside.Enable()
kmyQuest.pTG01DoorAfterInside.Enable()
pButtonTrigger.Enable()
pTGDoorCloser.Enable()
pRiftenPawnedPrawn.SetPublic(false)
completeallobjectives()
unregisterforupdate()
Game.AddAchievement(15)
kmyQuest.pTG02.setstage (10)
if kmyquest.pTG01GotStatue == 2
pTG01HaelgaStatuePostRef.Enable()
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG01QuestScript
Quest __temp = self as Quest
TG01QuestScript kmyQuest = __temp as TG01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player recieved payment from Keerava
SetObjectiveCompleted (20, 1)
if IsObjectiveDisplayed(21) == 1
SetObjectiveDisplayed (21, 0)
endif
kmyQuest.pTG01GotCash += 1
game.getplayer().additem(kmyQuest.pTG01Gold,kmyQuest.pTG01KeeravaGold)
pTG01QS.pTG01KeeravaPaid = 1
pTG01QS.CheckJobs()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  

TG01QuestScript Property pTG01QS  Auto  

ActorBase Property pBersi  Auto  

ActorBase Property pHaelga  Auto  

ObjectReference Property pButtonTrigger  Auto  

ObjectReference Property pTGDoorCloser  Auto  

ObjectReference Property pTG01HaelgaStatueRef  Auto  

ObjectReference Property pTG01HaelgaStatuePostRef  Auto  

ObjectReference Property pTG01UrnRef  Auto  

Quest Property TG00SP  Auto  

ActorBase Property pKeerava  Auto  

Cell Property pRiftenPawnedPrawn  Auto  
