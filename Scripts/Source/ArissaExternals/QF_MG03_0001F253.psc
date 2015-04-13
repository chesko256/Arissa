;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_MG03_0001F253 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG03MirabelleErvine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03MirabelleErvine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03FellglowEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03FellglowEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Book2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Book2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaarthalEye
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaarthalEye Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03SummonMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03SummonMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Book01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Book01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FellglowDungeonDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FellglowDungeonDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03CallerTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03CallerTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03OrthornGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03OrthornGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03CallerSummon01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03CallerSummon01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CollegeEye
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CollegeEye Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Orthorn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Orthorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03TolfdirHallMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03TolfdirHallMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FellglowRitualRoomDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FellglowRitualRoomDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03UragGroShub
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03UragGroShub Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03CallerSummon02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03CallerSummon02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03CallerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03CallerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03NiryaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03NiryaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03SummonMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03SummonMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Tolfdir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Tolfdir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03SavosAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03SavosAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03JzargoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03JzargoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Faralda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03ArchMageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03ArchMageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03AncanoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG03Book3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG03Book3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FellglowKeepInteriorDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FellglowKeepInteriorDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(60,1)
Alias_SaarthalEye.GetReference().Disable()
Alias_CollegeEye.GetReference().Enable()
Alias_MG03Tolfdir.GetReference().MoveTo(Alias_MG03TolfdirHallMarker.GetReference())
Alias_MG03Tolfdir.GetActorReference().EvaluatePackage()
Alias_MG03JzargoAlias.GetReference().MoveTo(EndMarkerJzargo)
Alias_MG03JzargoAlias.GetActorReference().EvaluatePackage()
Alias_MG03UraggroShub.GetReference().MoveTo(EndMarkerUrag)
Alias_MG03UragGroShub.GetActorReference().EvaluatePackage()
Alias_MG03MirabelleErvine.GetReference().MoveTo(EndMarkerMirabelle)
Alias_MG03MirabelleErvine.GetActorReference().EvaluatePackage()
Alias_MG03NiryaAlias.GetReference().MoveTo(EndMarkerNirya)
Alias_MG03NiryaAlias.GetActorReference().EvaluatePackage()
MG03EndScene.Start()
Alias_MG03AncanoAlias.GetReference().MoveTo(EndMarkerAncano)
Alias_MG03AncanoAlias.GetActorReference().EvaluatePackage()
Alias_MG03SavosAlias.GetReference().MoveTo(EndMarkerSavos)
Alias_MG03SavosAlias.GetActorReference().EvaluatePackage()
Alias_MG03ArchMageDoor.GetReference().SetLockLevel(255)
Alias_MG03ArchMageDoor.GetReference().Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;For Fellglow Keep
Alias_MG03FellglowEnableMarker.GetReference().Disable()
FellglowQuest.SetStage(255)
Alias_MG03Orthorn.GetReference().Disable()
SetObjectiveCompleted(60,1)
Alias_CollegeEye.GetReference().Enable()
Game.GetPlayer().RemoveItem(Alias_MG03Book01.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MG03Book2.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_MG03Book3.GetReference(),1)
Game.GetPlayer().Additem(SkillRestoration01, 1)
Game.GetPlayer().Additem(SkillAlteration1, 1)
Game.GetPlayer().Additem(SkillConjuration1,1)
Game.GetPlayer().Additem(SkillEnchanting1,1)
Game.GetPlayer().Additem(SkillDestruction1,1)
Game.GetPlayer().Additem(SkillIllusion1,1)
Game.GetPlayer().SetFactionRank(CollegeFaction,2)
MG03QuestScript QuestScript = MG03 as MG03QuestScript
if QuestScript.MG03OrthornFree == 0
SetObjectiveDisplayed(50,0)
endif
MG04.Start()
FellglowKeepLocation.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_MG03Orthorn.GetReference().Enable()
Alias_MG03CallerAlias.GetReference().Enable()
FellglowKeepMapMarker.AddToMap(False)
Alias_MG03AncanoAlias.GetReference().MoveTo(MG03AncanoMoveMarker)
Alias_MG03AncanoAlias.GetActorReference().EvaluatePackage()
;For Fellglow Keep
Cell_FellglowKeep01.Reset()
Cell_FellglowKeep02.Reset()
Cell_FellglowKeep03.Reset()
Alias_MG03FellglowEnableMarker.GetReference().Enable()
FellglowQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(50,1)
Alias_MG03Orthorn.GetActorReference().AddToFaction(MG03OrthornFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
setObjectiveDisplayed(50,1)
MG03QuestScript QuestScript = MG03 as MG03QuestScript
QuestScript.MG03GuardSceneRun = -1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if MG02.GetStage() < 200
MG01.SetStage(200)
MG02.SetStage(200)
endif
Alias_MG03Faralda.GetReference().Moveto(MG03FaraldaForcegreetMarker)
Alias_MG03Faralda.GetActorReference().EvaluatePackage()
Alias_MG03CallerSummon01.GetReference().Disable()
Alias_MG03CallerSummon02.GetReference().Disable()

Alias_MG03CallerSummon01.GetActorReference().SetActorValue("Aggression",2)
Alias_MG03CallerSummon02.GetActorReference().SetActorValue("Aggression",2)

DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction,1)

SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MG03  Auto  

Quest Property MGDialogueQuest  Auto  

Quest Property FellglowQuest Auto  

Quest Property MG04  Auto  

Faction Property CollegeFaction  Auto  

Cell Property Cell_FellglowKeep01  Auto  

Cell Property Cell_FellglowKeep02  Auto  

Cell Property Cell_FellglowKeep03  Auto  

ObjectReference Property EndMarkerJzargo  Auto  

ObjectReference Property EndMarkerMirabelle  Auto  

ObjectReference Property EndMarkerNirya  Auto  

ObjectReference Property EndMarkerUrag  Auto  

ObjectReference Property EndMarkerAncano  Auto  

ObjectReference Property EndMarkerSavos  Auto  

scene Property MG03EndScene  Auto  

quest Property MG01  Auto  

Quest Property MG02  Auto  

ObjectReference Property FellglowKeepMapMarker  Auto  

book Property skillrestoration01  Auto  

book Property skillalteration1  Auto  

book Property skilldestruction1  Auto  

book Property skillconjuration1  Auto  

book Property skillenchanting1  Auto  

book Property skillillusion1  Auto  

Faction Property MG03OrthornFaction  Auto  

ObjectReference Property MG03FaraldaForcegreetMarker  Auto  

ObjectReference Property MG03AncanoMoveMarker  Auto  

LocationAlias Property FellglowKeepLocation  Auto  
