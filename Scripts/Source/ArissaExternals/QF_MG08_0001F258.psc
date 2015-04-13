;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_MG08_0001F258 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG08TolfdirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08TolfdirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08GateAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08GateAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08EyeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08EyeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08Faralda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08TandilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08TandilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08AncanoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08AncanoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGGate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MGGate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08QuaranirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08QuaranirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08ArnielAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08ArnielAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08RubbleEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08RubbleEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08GelebrosAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08GelebrosAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG08SergiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG08SergiusAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
MG08RubbleEnableMarker.GetReference().Enable()
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1

Alias_MG08TolfdirAlias.GetReference().MoveTo(MG07TolfdirBridgeMarker)
if MG07.GetStage() < 200
Game.GetPlayer().MoveTo(Alias_MG08TolfdirAlias.GetReference())

SavosAren.Disable()
MirabelleErvine.Disable()
Game.Getplayer().setfactionrank (MGFaction, 4)
Game.GetPlayer().Additem(Staff, 1)
endif
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_MG08EyeAlias.GetReference().PlayAnimation("Open")
TolfdirApproachScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_MG08AncanoAlias.GetActorReference().AddSpell(AbMG08AncanoMagicka)
;MG08AncanoHallScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if MG07.GetStage() < 50
	MG01.SetStage(200)
	MG02.SetSTage(200)
	MG03.SetStage(200)
	MG04.SetStage(200)
	MG05.SetStage(200)
	MG06.SetStage(200)
	Alias_MG08AncanoAlias.GetActorReference().EvaluatePackage()
	Alias_MG08TolfdirAlias.GetReference().MoveTo(MG07TolfdirBridgeMarker)
	Alias_MG08TolfdirAlias.GetActorReference().EvaluatePackage()
	Game.GetPlayer().MoveTo(MG07TolfdirBridgeMarker)
	SavosAren.Disable()
	MirabelleErvine.Disable()
	Game.Getplayer().setfactionrank (MGFaction, 4)
	Game.GetPlayer().Additem(Staff, 1)
endif

if MG07.GetStage() < 200
	MG07.SetStage(200)
endif

Ancano.SetInvulnerable()
Alias_MG08EyeAlias.GetReference().Enable()
If SavosArenRef.isEnabled() == 1
SavosArenRef.Disable()
endif

;BarrierCollisionRef.Enable()
Alias_MG08GateAlias.GetReference().SetOpen(False)
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction,5)


SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_MG08QuaranirAlias.GetReference().MoveTo(QuaranirStartMarker)
Alias_MG08QuaranirAlias.GetReference().Enable()
Alias_MG08QuaranirAlias.GetActorReference().SetAlpha(0)
While Alias_MG08QuaranirAlias.GetReference().Is3Dloaded() == False
	Utility.Wait(0.1)
endwhile
MGTeleportInEffect.Play(Alias_MG08QuaranirAlias.GetReference(), 3.6)
Alias_MG08QuaranirAlias.GetActorReference().SetAlpha(1, true)
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE MG08QuestScript
Quest __temp = self as Quest
MG08QuestScript kmyQuest = __temp as MG08QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)
Alias_MG08TandilAlias.GetReference().Disable()
;Alias_MG08EyeAlias.GetReference().Disable()
Game.GetPlayer().SetFactionRank(CollegeFaction,6)
ArchMageBed.SetFactionOwner(PlayerFaction)
Game.GetPlayer().AddPerk(MGArchMageVendorPerk)
Game.GetPlayer().AddToFaction(CollegeofWinterholdArchMageFaction)
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).CollegeUnsafe=False
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).RegisterforSingleUpdateGameTime(24 * 3)
Alias_MG08TolfdirAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
MGStaffAlias.Clear()
WinterholdCollegeMapMarkerRef.Enable()
Game.AddAchievement(14)
Game.IncrementStat("Questlines Completed",1)
if MGRArniel02.GetStage() == 200
MGRArniel03.Start()
endif
Stop()
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

ActorBase Property Ancano  Auto  

ObjectReference Property MG07TolfdirBridgeMarker  Auto  

Scene Property MG08AncanoHallScene  Auto  

Quest Property MG07  Auto  

ObjectReference Property SavosAren  Auto  

ObjectReference Property MirabelleErvine  Auto  

ObjectReference Property QuaranirStartMarker  Auto  

Scene Property TolfdirApproachScene  Auto  

Faction Property MGFaction  Auto  

Weapon Property Staff  Auto  

Faction Property ThalmorFaction  Auto  


Quest Property MGDialogueQuest  Auto  



ReferenceAlias Property MGStaffAlias  Auto  

ReferenceAlias Property MG08RubbleEnableMarker  Auto  


Faction Property MGThalmorFaction  Auto  

Faction Property CollegeFaction  Auto  

ObjectReference Property BarrierCollisionRef  Auto  

objectreference Property SavosArenRef  Auto  

Quest Property MG01  Auto  

Quest Property MG02  Auto  

Quest Property MG03  Auto  

Quest Property MG04  Auto  

Quest Property MG05  Auto  

Quest Property MG06  Auto  

ObjectReference Property MGEyeCollegeRef  Auto  

quest Property DialogueWinterholdCollege  Auto  


Quest Property MGRArniel02  Auto  

Quest Property MGRArniel03  Auto  

Faction Property CollegeofWinterholdArchMageFaction  Auto  

VisualEffect Property MGTeleportInEffect  Auto  

ObjectReference Property WinterholdCollegeMapMarkerRef  Auto  

ObjectReference Property ArchMageBed  Auto  

Faction Property PlayerFaction  Auto  

Perk Property MGArchMageVendorPerk  Auto  

SPELL Property AbMG08AncanoMagicka  Auto  
