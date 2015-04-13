;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_MG04_0001F254 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG04AugurSpeaker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurSpeaker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04SavosArenAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04SavosArenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04TolfdirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04TolfdirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04MirabelleAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04MirabelleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04QuaranirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04QuaranirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurSpeaker4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurSpeaker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurSpeaker3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurSpeaker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurFlame
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurFlame Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04QuaranirSceneTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04QuaranirSceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AugurSpeaker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AugurSpeaker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04UragAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04UragAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04AncanoAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04ArchMageDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04ArchMageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG04EyeAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG04EyeAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
MG04ClassroomScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE MG04QuestScript
Quest __temp = self as Quest
MG04QuestScript kmyQuest = __temp as MG04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
ArchMageDoor.Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE MG04QuestScript
Quest __temp = self as Quest
MG04QuestScript kmyQuest = __temp as MG04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)
Game.GetPlayer().SetFactionRank(CollegeFaction,3)
Game.GetPlayer().Additem(MG04RewardLVL,1)
Alias_MG04AncanoAlias.GetActorReference().ModFavorPoints(-(kmyquest.FavorRewardSmall.GetValueInt()))
Alias_MG04AugurDoor.GetReference().Lock()
Alias_MG04AugurDoor.GetReference().SetOpen(false)
MG06.Start()
MGRitual04.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
Alias_MG04QuaranirAlias.GetReference().Disable()
Alias_MG04AugurAlias.GetReference().Disable(true)
Alias_MG04AugurFlame.GetReference().SetAnimationVariableFloat("fmagicburnamount",0)
AtrFrgRecipeChance.setValueInt(98)
AtrFrgRecipeChestChance.setValueInt(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if MG03.GetStage() < 200
MG01.SetStage(200)
MG02.SetStage(200)
MG03.SetStage(200)
ArchMageDoor.SetLockLevel(255)
ArchMageDoor.Lock()
endif
Alias_MG04AncanoAlias.GetReference().MoveTo(MG04AncanoArchMageMarker)
Alias_MG04TolfdirAlias.GetReference().Moveto(MG04TolfdirTeachMark)
Alias_MG04TolfdirAlias.GetActorReference().EvaluatePackage()

DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction,2)
SetStage(10)
MG04UragScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(15,1)
SetObjectiveDisplayed(20,1)
Alias_MG04QuaranirAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;MG04TestMonkSceneMessage.Show()
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
MG04MonkSceneQuest.SetStage(200)
MG04QuaranirScene.Start()

MG04AugurSpeakScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MG04AncanoStartMark  Auto  

ObjectReference Property MG04TolfdirTeachMark  Auto  

Message Property MG04TestMonkSceneMessage  Auto  

Quest Property MG06  Auto  

Scene Property MG04QuaranirScene  Auto  

Scene Property MG04AugurSpeakScene  Auto  

Quest Property MGDialogueQuest  Auto  

Quest Property MG04MonkSceneQuest  Auto  

Faction Property CollegeFaction  Auto  

scene Property MG04UragScene  Auto  

Quest Property MG01  Auto  

Quest Property MG02  Auto  

Quest Property MG03  Auto  

scene Property MG04ClassroomScene  Auto  

ObjectReference Property MG04AncanoArchMageMarker  Auto  

Quest Property MGRitual04  Auto  

LeveledItem Property MG04RewardLVL  Auto  

ObjectReference Property ArchMageDoor  Auto  

GlobalVariable Property AtrFrgRecipeChance  Auto  

GlobalVariable Property AtrFrgRecipeChestChance  Auto  
