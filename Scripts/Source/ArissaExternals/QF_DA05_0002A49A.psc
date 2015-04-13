;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 44
Scriptname QF_DA05_0002A49A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hunter5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HircinesRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HircinesRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sinding
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sinding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HircinesRingQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HircinesRingQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestingBeastTA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestingBeastTA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkinBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkinBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GreatHuntStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GreatHuntStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter_2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter_2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SindingSkin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SindingSkin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimFather
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimFather Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter_4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter_4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter_1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter_1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter_3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter_3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SindingGhost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SindingGhost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Funeralizer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Funeralizer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestingBeastGhost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestingBeastGhost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestingBeast
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestingBeast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMother
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMother Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
dunDA05POIMarker.disable()
DA05FuneralScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(55, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
if (IsObjectiveDisplayed(55) && !IsObjectiveCompleted(55))
	SetObjectiveFailed(55)
endif
SetObjectiveDisplayed(60, 0)
SetObjectiveDisplayed(70, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
Alias_HircinesRingQuestItem.Clear()
dunDA05POIMarker.enable()
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(61, 1)
SetObjectiveDisplayed(65, 1)

;Bloated Man's Grotto setup. Removes the Bloodmoon, etc.
dunBloatedMansGrottoQST.Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
Alias_VictimFather.GetActorRef().AddToFaction(CR08ExclusionFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(80, 1)
AchievementsQuest.IncDaedricQuests()
; set up Hircine outside
Alias_QuestingBeastGhost.GetReference().MoveTo(OutsideHircineMarker)
Alias_QuestingBeastGhost.GetReference().Enable()
Alias_QuestingBeastGhost.GetActorRef().SetNoFavorAllowed(true)
(Alias_QuestingBeastGhost as DA05QuestingBeastGhostScript).Setup()
Alias_QuestingBeastTA.GetReference().MoveTo(OutsideHircineMarker)
OutsideTrigger.Enable()

Alias_Sinding.GetActorReference().ModFavorPointsWithGlobal(MajorFavorPoints)

SetStage(200)

;Bloated Man's Grotto setup. Removes the Bloodmoon, etc.
dunBloatedMansGrottoQST.Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
FailAllObjectives()
dunDA05POIMarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
if (IsObjectiveDisplayed(80))
	SetObjectiveFailed(80)
endif

SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(61, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(50, 1)

Alias_QuestingBeastGhost.GetRef().Disable(true)

BloatedMansGrottoMapMarker.AddToMap()

;Bloated Man's Grotto setup. Takes care of enabling the hunters, enabling and moving Sinding, etc.
Alias_Sinding.ForceRefTo(WolfSinding)
dunBloatedMansGrottoQST.Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
dunDA05POIMarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DA05QuestScript
Quest __temp = self as Quest
DA05QuestScript kmyQuest = __temp as DA05QuestScript
;END AUTOCAST
;BEGIN CODE
if (kmyQuest.PlayerTalkedToHunter)
	SetObjectiveCompleted(55, 1)
else
	SetObjectiveDisplayed(55, 0)
endif

if (IsObjectiveDisplayed(70))
	SetObjectiveDisplayed(70, 0)
endif

SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DA05QuestScript
Quest __temp = self as Quest
DA05QuestScript kmyQuest = __temp as DA05QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.WaitForCallback()

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

RegisterForUpdateGameTime(1)

Alias_QuestingBeast.GetRef().Enable()

Alias_VictimFather.GetActorRef().RemoveFromFaction(CR08ExclusionFaction)

;DA05WitchMarker.Enable()
;AspirantMarker.Disable()
;C04WitchMarker.Disable()
;SpiderMarker.Disable()

;GlenmorilMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(65, 1)
AchievementsQuest.IncDaedricQuests()
Game.GetPlayer().RemoveItem(SindingSkin, 1)
Game.GetPlayer().AddItem(SaviorsHide, 1)
Alias_SindingGhost.GetRef().Disable(true)
AchievementsQuest.IncDaedricArtifacts()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property GlenmorilMapMarker  Auto  

ObjectReference Property BloatedMansGrottoMapMarker  Auto  

Quest Property dunBloatedMansGrottoQST  Auto  

GlobalVariable Property MajorFavorPoints  Auto  

ObjectReference Property DA05WitchMarker  Auto  

ObjectReference Property AspirantMarker  Auto  

ObjectReference Property C04WitchMarker  Auto  

ObjectReference Property SpiderMarker Auto  

Race Property NordRace  Auto  

Actor Property WolfSinding  Auto  

Armor Property SaviorsHide  Auto  

MiscObject Property SindingSkin  Auto  

ObjectReference Property OutsideHircineMarker  Auto  

ObjectReference Property OutsideTrigger  Auto  

ObjectReference Property dunDA05POIMarker  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Faction Property CR08ExclusionFaction  Auto  

Scene Property DA05FuneralScene  Auto  
