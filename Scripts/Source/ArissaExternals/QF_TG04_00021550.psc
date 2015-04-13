;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_TG04_00021550 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Mercer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mercer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG04DeedAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04DeedAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brynjolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brynjolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG04KillChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04KillChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG04FirebrandWine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04FirebrandWine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG04DeathNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04DeathNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gulum_Ei
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gulum_Ei Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Make the Wine choice with Gulum-Ei
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (35,1)
if IsObjectiveDisplayed(20) == 1
setObjectiveCompleted(20,1)
endif
Alias_TG04FirebrandWine.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Wine Situation Resolved, Follow Gulum-Ei
SetObjectiveCompleted (35,1)
SetObjectiveCompleted (37,1)
SetObjectiveDisplayed (40,1)
kmyQuest.pTG04HiddenPathEnableRef.enable()
pTG04BanditEnabler.enable()
Alias_Gulum_Ei.RegisterForSingleUpdate(0.50)
pGulum.SetEssential(false)
pGulum.SetProtected()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.pTG04QuestFailure == 0
pTG04PostQuest.SetStage(10)
endif
completeallobjectives()
pTGFencesQuest.SetStage(10)
pTG04Brinewater.setStage(100)
kmyQuest.pTG05Quest.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to Speak to Mercer about next job
SetObjectiveDisplayed (10,1)
Alias_Gulum_Ei.GetActorRef().moveto(kmyQuest.pTG04GulumEiInitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has traced Gulum-Ei to Brinewater Grotto
if IsObjectiveDisplayed(55) == 0
SetObjectiveCompleted (40,1)
SetObjectiveDisplayed (50,1)
endif
kmyQuest.dunBrinewaterBlackplaneParent.disable(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has gotten the information from Gulum-Ei (or the Kill Chest) and needs to return to Mercer Frey
pTG04DisableOnReset.Disable()
if IsObjectiveDisplayed(50) == 1
SetObjectiveCompleted (50,1)
endif
if IsObjectiveDisplayed(55) == 1
SetObjectiveCompleted (55,1)
endif
SetObjectiveDisplayed (60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Gulum-Ei done his walk or has been slain
kmyQuest.pTG04Door.Lock(false)

if pGulum.GetDeadCount() == 0
Alias_Gulum_Ei.GetActorRef().EvaluatePackage()
Alias_Gulum_Ei.GetActorRef().moveto(kmyQuest.pTG04GulumEiEndMarker)
endif

pTG04SPQuest.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Gulum-Ei Stealth Mode On
if pGulum.GetDeadCount() == 0
kmyQuest.pTG04SPQuest.SetStage(10)
if pEECWarehouse == Alias_Gulum_Ei.GetActorRef().GetCurrentLocation()
Alias_Gulum_Ei.GetActorRef().MoveTo(kmyQuest.pTG04GulumEiStartMarker)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Player bypassed getting the wine using Persuade.
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (37,1)
if IsObjectiveDisplayed(20) == 1
setObjectiveDisplayed(20,0)
endif
if Game.GetPlayer().GetItemCount(pFBWineCase) >= 1
Game.GetPlayer().RemoveItem(Alias_TG04FirebrandWine.GetRef())
Game.GetPlayer().AddItem(pWineReward,3)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Stealth Scene Debug
setstage(10)
pTG00Quest.Stop()
setstage(20)
setstage(30)
kmyQuest.pTG04Time.Value = 16
Alias_Gulum_Ei.GetActorRef().moveto(kmyQuest.pTG04GulumEiStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Optional Talked to Brynjolf Completed
SetObjectiveCompleted (20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Debug and Quest Setup
Game.GetPlayer().AddToFaction(kmyQuest.pTG04TGFaction)
setstage(10)
pTG00Quest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Aquired Firebrand Wine case
SetObjectiveCompleted (35,1)
SetObjectiveDisplayed (37,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TG04QuestScript
Quest __temp = self as Quest
TG04QuestScript kmyQuest = __temp as TG04QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has been given basics from Mercer... optional get details from Brynjolf now
;Head out to Solitude and talk to Gulum-Ei
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto 

MiscObject Property pFBWineCase  Auto  

Quest Property pTG04PostQuest  Auto  

Quest Property pTGFencesQuest  Auto  

ActorBase Property pGulum  Auto  

WorldSpace Property pEEC  Auto  

Quest Property pTG04SPQuest  Auto  

LeveledItem Property pWineReward  Auto

Location Property pEECWarehouse  Auto  

Quest Property pTG04Brinewater  Auto  

ObjectReference Property pTG04DisableOnReset  Auto  

ObjectReference Property pTG04BanditEnabler  Auto  
