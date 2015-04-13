;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname QF_MG01_0001F251 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01NiryaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01NiryaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01StoneAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01StoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01OnmundAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01OnmundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01JzargoAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01JzargoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01MirabelleAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01MirabelleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01TolfdirAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01TolfdirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01ClassroomExtDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01ClassroomExtDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01AncanoAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01ClassroomIntDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01ClassroomIntDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01FaraldaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01FaraldaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CastMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01BrelynaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01BrelynaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG01GateAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MG01GateAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_MG01OnmundAlias.GetReference().Moveto(MG01OnmundClassMarker)
Alias_MG01BrelynaAlias.GetReference().MoveTo(MG01BrelynaClassMarker)
Alias_MG01JzargoAlias.GetReference().MoveTo(MG01JzargoClassMarker)
Alias_MG01FaraldaAlias.GetReference().MoveTo(NiryaWaitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(21,1)
if PointerQuest.GetStage() > 0
PointerQuest.SetStage(200)
endif
;MG01TestCastMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE MG01QuestScript
Quest __temp = self as Quest
MG01QuestScript kmyQuest = __temp as MG01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)
Alias_MG01TolfdirAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardSmall.GetValueInt())
MG02.Start()
MGCollegeLectures.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
if IsObjectiveDisplayed(30)
if IsObjectiveCompleted(30) == 0
SetObjectiveDisplayed(30,0)
endif
endif
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
MG01WellCollisionRef.Disable()
MG01TourScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
if PointerQuest.GetStage() > 0
PointerQuest.SetStage(200)
endif
;MG01TestCastMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(23,1)
if PointerQuest.GetStage() > 0
PointerQuest.SetStage(200)
endif
;MG01TestCastMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(24,1)
if PointerQuest.GetStage() > 0
PointerQuest.SetStage(200)
endif
;MG01TestCastMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveCompleted(21,1)
SetObjectiveCompleted(22,1)
SetObjectiveCompleted(23,1)
SetObjectiveCompleted(24,1)
SetObjectiveDisplayed(30,1)
Game.GetPlayer().SetFactionRank(CollegeFaction, 0)
Game.AddAchievement(12)
Alias_MG01GateAlias.GetReference().Lock(false)
;Alias_MG01GateAlias.GetReference().SetOpen(true)
TempGateRef.SetOpen(true)
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;test
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

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
MG01WellCollisionRef.Disable()
MG01TourScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(22,1)
if PointerQuest.GetStage() > 0
PointerQuest.SetStage(200)
endif
;MG01TestCastMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MG01OnmundClassMarker  Auto  

ObjectReference Property MG01JzargoClassMarker  Auto  

ObjectReference Property MG01BrelynaClassMarker  Auto  

Scene Property MG01TourScene  Auto  

Quest Property MG02  Auto  

Message Property MG01TestCastMessage  Auto  

Quest Property MGDialogueQuest  Auto  

Faction Property CollegeFaction  Auto  

ObjectReference Property NiryaWaitMarker  Auto  

Quest Property PointerQuest  Auto  

ObjectReference Property TempGateRef  Auto  

Quest Property MGCollegeLectures  Auto  

ObjectReference Property MG01WellCollisionRef  Auto  

ObjectReference Property MG01AncanoSceneMarker  Auto  

ObjectReference Property MG01MirabelleSceneMarker  Auto  
