;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname QF_TG03_0002154F Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG03PoisonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03PoisonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03BrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03MallusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03MallusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03DeadSkeever02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03DeadSkeever02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03HoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03HoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03CaptainAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03CaptainAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03BrewingVatAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03BrewingVatAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03SabjornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SabjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03MavenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03MavenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03SabjornLetterAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SabjornLetterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03DeadSkeever01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03DeadSkeever01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03HonningbrewDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03HonningbrewDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03EimarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03EimarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03SabjornChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SabjornChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03NestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03NestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03BoileryDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03BoileryDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Nest is Poisoned
SetObjectiveCompleted (45,1)
kmyQuest.pTG03SabjornJobs += 1
if kmyQuest.pTG03SabjornJobs >= 2
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player needs to Speak to Sabjorn at the Honningbrew Meadery
pHonningbrewMeaderyMapMarker.AddToMap()
pTG03QS.PrepTheMeadery()
pTG03MessEnabler.Enable()
kmyQuest.pTG03SkeeverEnabler.Enable()
pTG03DoorMarker.Enable()
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
Alias_TG03SabjornAlias.GetActorReference().MoveTo(kmyQuest.pTG03SabjornMarker)
Alias_TG03SabjornAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Speak to Mallus
SetObjectiveCompleted (70,1)
SetObjectiveDisplayed (80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
pTGFencesQuest.SetStage(20)
kmyQuest.pTGHonningbrewPackages.Value = 0
Alias_TG03SabjornAlias.GetActorRef().moveto(pTG03SabjornJailMarker)
Alias_TG03SabjornAlias.GetActorRef().Enable()
kmyQuest.pTG03SkeeverEnabler.Disable()
pTG03ExternalEnabler.Enable()
pTG03InternalEnabler.Enable()
pTG03InternalEnabler02.Enable()
pTG03InternalEnabler03.Enable()
pTG03Bed.Enable()
pHonningbrewLevelListChanger.Value = 100
kmyQuest.pTGPostQuest.SetStage(40)
completeallobjectives()
kmyQuest.pTG04.setstage (10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Get the evidence for Maven
Game.GetPlayer().AddItem(kmyQuest.pTG03MeaderyOfficeKey,1)
SetObjectiveCompleted (80,1)
SetObjectiveDisplayed (90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has been told to speak to Maven
SetObjectiveDisplayed (10,1)
Alias_TG03MallusAlias.GetActorReference().MoveTo(kmyQuest.pTG03InnMarker)
Alias_TG03MallusAlias.GetActorReference().EvaluatePackage()
Alias_TG03EimarAlias.GetActorReference().MoveTo(kmyQuest.pTG03InnMarker)
Alias_TG03EimarAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player now has access to Meadery
Game.GetPlayer().AddItem(Alias_TG03PoisonAlias.GetRef())
if pTG03Qs.pTG03PayMe == 1
Game.GetPlayer().AddItem(pTG03Gold,500)
endif
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (45,1)
SetObjectiveDisplayed (50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Speak to Brynjolf
if kmyquest.pTG03QuestFailure == 0
Game.GetPlayer().AddItem(pTG03Reward,1)
endif
pHonningbrewMeadery01.SetPublic(false)
ppHonningbrewFrontDoorRef.SetFactionOwner(pHonningbrewMeaderyFaction)
SetObjectiveCompleted (100,1)
SetObjectiveDisplayed (110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;All Jobs Complete - Return to Sabjorn
SetObjectiveDisplayed (60,1)
Game.GetPlayer().RemoveItem(Alias_TG03PoisonAlias.GetRef())
pTG03MessEnabler.Disable()
Alias_TG03CaptainAlias.GetActorReference().MoveTo(kmyQuest.pTG03CaptainMarker)
Alias_TG03CaptainAlias.GetActorReference().EvaluatePackage()
Alias_TG03MallusAlias.GetActorReference().MoveTo(kmyQuest.pTG03MallusMarker)
Alias_TG03MallusAlias.GetActorReference().EvaluatePackage()
Alias_TG03EimarAlias.GetActorReference().MoveTo(kmyQuest.pTG03EimarMarker)
Alias_TG03EimarAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Bring Info to Maven
SetObjectiveCompleted (90,1)
SetObjectiveDisplayed (100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Attend the Tasting
SetObjectiveCompleted (60,1)
SetObjectiveDisplayed (70,1)
kmyQuest.pTG03SPQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Quest Start Quest
pTG00Quest.Stop()
Game.GetPlayer().AddToFaction(kmyQuest.pTG03TGFaction)
setstage (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has been sent by Maven to speak to Mallus at the Flagon.
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE TG03QuestScript
Quest __temp = self as Quest
TG03QuestScript kmyQuest = __temp as TG03QuestScript
;END AUTOCAST
;BEGIN CODE
;Vat Poisoned
SetObjectiveCompleted (50,1)
kmyQuest.pTG03SabjornJobs += 1
if kmyQuest.pTG03SabjornJobs >= 2
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pTG03Gold  Auto  

Quest Property pTG00Quest  Auto  

ObjectReference Property pTG03SabjornJailMarker  Auto  

ObjectReference Property pTG03SabjornExileMarker  Auto  

ObjectReference Property pTG03WorkerTavernMarker  Auto  

ObjectReference Property pTG03BoardedDoor  Auto  

TG03QuestScript Property pTG03QS Auto 

LeveledItem Property pTG03Reward  Auto  

Quest Property pTGFencesQuest  Auto  

ObjectReference Property pHonningbrewMeaderyMapMarker  Auto  

ObjectReference Property pTG03MessEnabler  Auto  

ObjectReference Property pTG03Bed  Auto  

ObjectReference Property pTG03ExternalEnabler  Auto  

ObjectReference Property pTG03InternalEnabler  Auto  

ObjectReference Property pTG03InternalEnabler02  Auto  

ObjectReference Property pTG03InternalEnabler03  Auto  

GlobalVariable Property pHonningbrewLevelListChanger  Auto  

ObjectReference Property pTG03DoorMarker  Auto  

cell Property pHonningbrewMeadery01  Auto  

ObjectReference Property ppHonningbrewFrontDoorRef  Auto  

Faction Property pHonningbrewMeaderyFaction  Auto  
