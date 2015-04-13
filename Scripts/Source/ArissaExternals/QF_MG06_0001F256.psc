;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname QF_MG06_0001F256 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG06FalmerBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06FalmerBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06TandilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06TandilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06SavosArenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06SavosArenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage30TargetMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage30TargetMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MzulftLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MzulftLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06MirabelleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06MirabelleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObservatoryKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObservatoryKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06ParatusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06ParatusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06TelescopeActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06TelescopeActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06AncanoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage30TargetMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage30TargetMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06CrystalTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06CrystalTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06NerienAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06NerienAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06Crystal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06Crystal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObservatoryKeyContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObservatoryKeyContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArmillaryButton02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArmillaryButton02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06Sergius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06Sergius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06GavrosAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06GavrosAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG06StartingKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG06StartingKey Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
if MG04.GetStage() < 200
MG01.SetStage(200)
MG02.SetStage(200)
MG03.SetStage(200)
MG04.SetStage(200)
;Game.GetPlayer().Moveto(Alias_MG06MirabelleAlias.GetReference())
endif

DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction,3)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(55,1)
SetObjectiveDisplayed(60,1)
ParatusDecimius.SetEssential(False)
Alias_MG06MirabelleAlias.GetReference().MoveTo(MG06Stage60MirabelleMarker)
Alias_MG06MirabelleAlias.GetActorReference().EvaluatePackage()
Alias_MG06SavosArenAlias.GetReference().MoveTo(MG06Stage60ArenMarker)
Alias_MG06SavosArenAlias.GetActorReference().EvaluatePackage()
Alias_MG06AncanoAlias.GetReference().MoveTo(MG06Stage60AncanoMarker)
Alias_MG06AncanoAlias.GetActorReference().EvaluatePackage()
Ancano.SetInvulnerable()
Alias_MG06AncanoAlias.GetActorReference().SetGhost()
MG06DoorBarrierRef.Enable()
MG06DoorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
if IsObjectiveDisplayed(37)
setObjectiveCompleted(37,1)
endif
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MG06QuestScript
Quest __temp = self as Quest
MG06QuestScript kmyQuest = __temp as MG06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
MzulftMapMarker.AddToMap(False)
Alias_MG06GavrosAlias.GetReference().Enable()
MG06GavrosScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE MG06QuestScript
Quest __temp = self as Quest
MG06QuestScript kmyQuest = __temp as MG06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(60,1)
Game.GetPlayer().SetFactionRank(CollegeFaction,4)
Alias_MG06MirabelleAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardMedium.GetValueInt())
MG05.Start()
MG05.SetStage(0)
Game.AddAchievement(13)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(55,1)
MG06OculoryFinalScene.Start()
MG06MapBeamRef.PlayAnimation("PlayAnim02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().Moveto(MG05PlayerStartMarker)
if (Follower.GetReference() != None)
Follower.GetReference().MoveTo(MG05FollowerMarker)
endif
if (AnimalFollower.GetReference() != None)
AnimalFollower.GetReference().MoveTo(MG05FollowerMarker)
endif
MG05MirabelleWoundedMarker.Enable()
MG05SmallBarrierRef.Enable()
Alias_MG06MirabelleAlias.GetActorReference().DispelAllSpells()
Alias_MG06MirabelleAlias.GetReference().Moveto(MG05MirabelleWoundedMarker)
Alias_MG06MirabelleAlias.GetActorReference().EvaluatePackage()

Alias_MG06SavosArenAlias.GetActorReference().GetActorBase().SetEssential(False)

Alias_MG06SavosArenAlias.GetActorReference().Kill()
Alias_Mg06SavosArenAlias.GetReference().MoveTo(MG06ArenFinalMarker)
Alias_MG06SavosArenAlias.GetReference().BlockActivation(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE MG06QuestScript
Quest __temp = self as Quest
MG06QuestScript kmyQuest = __temp as MG06QuestScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(32) == 1
SetObjectiveCompleted(35)
else
SetObjectiveCompleted(30)
endif
SetObjectiveDisplayed(37)
MG06ParatusTravelScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(25,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE MG06QuestScript
Quest __temp = self as Quest
MG06QuestScript kmyQuest = __temp as MG06QuestScript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(37)
SetObjectiveCompleted(37,1)
endif
if IsObjectiveDisplayed(40)
SetObjectiveCompleted(40,1)
endif
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE MG06QuestScript
Quest __temp = self as Quest
MG06QuestScript kmyQuest = __temp as MG06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(30,1)
;kMyQuest.UnregisterforUpdate()
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).CollegeUnsafe=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetObjectiveCompleted(32)
SetObjectiveDisplayed(35)
;test
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MG06Stage60MirabelleMarker  Auto  


ObjectReference Property MG06Stage60ArenMarker  Auto  

Scene Property MG06DoorScene  Auto  

ObjectReference Property MG06Stage60AncanoMarker  Auto  

ObjectReference Property MG05PlayerStartMarker  Auto  

Quest Property MG05  Auto  

ObjectReference Property MG06MirabelleFinalMarker  Auto  

ObjectReference Property MG06ArenFinalMarker  Auto  

Quest Property MG04  Auto  

Quest Property MGDialogueQuest  Auto  

Scene Property MG06ParatusTravelScene  Auto  

Faction Property CollegeFaction  Auto  

quest Property MG01  Auto  

quest Property MG02  Auto  

quest Property MG03  Auto  

Scene Property MG06OculoryFinalScene  Auto  

ObjectReference Property MG05MirabelleWoundedMarker  Auto  

scene Property MG06GavrosScene  Auto  

Quest Property DialogueWinterholdCollege  Auto  

ObjectReference Property MG06DoorBarrierRef  Auto  

ObjectReference Property MG05SmallBarrierRef  Auto  

ObjectReference Property MzulftMapMarker  Auto  

ActorBase Property ParatusDecimius  Auto  

ObjectReference Property MG06MapBeamREF  Auto  

ActorBase Property Ancano  Auto  

ReferenceAlias Property Follower  Auto  

ObjectReference Property MG05FollowerMarker  Auto  

ReferenceAlias Property AnimalFollower  Auto  
