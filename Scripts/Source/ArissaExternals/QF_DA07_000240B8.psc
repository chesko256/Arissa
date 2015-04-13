;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 77
Scriptname QF_DA07_000240B8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RazorPommel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RazorPommel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Drascua
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Drascua Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DagonDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DagonDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilusHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SilusHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dremora02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dremora02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RazorBlade
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RazorBlade Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dremora1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dremora1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilusDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilusDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DagonVoiceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DagonVoiceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VoiceofDagon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VoiceofDagon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XarxesCase
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XarxesCase Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrackedTuskKeep
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CrackedTuskKeep Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DagonSpeaksTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DagonSpeaksTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReforgeTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReforgeTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadCroneRock
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DeadCroneRock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CommentariesCase
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CommentariesCase Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorgen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorgen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JorgenChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JorgenChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RazorHilt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RazorHilt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghunzul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghunzul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MehrunesRazor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MehrunesRazor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dremora2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dremora2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dremora01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dremora01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RobesCase
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RobesCase Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HagRockRedoubt
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HagRockRedoubt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RazorCase
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RazorCase Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
;Silus dies before he reaches the Shrine of Mehrunes' Dagon
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
;Player speaks to Dagon, enable the reforge trigger
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

Alias_DagonSpeaksTrigger.GetRef().Disable()
Alias_ReforgeTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
; Player has given Silus the Pommel
SetObjectiveCompleted(20, 1)
Game.GetPlayer().RemoveItem(Alias_RazorPommel.GetRef())

kmyquest.DecrementRazorCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is told to kill Silus
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

;Trigger Silus's forcegreet
Utility.Wait(1)
Alias_Silus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
; Player is asked to bring the hilt to Silus
SetObjectiveCompleted(14, 1)
SetObjectiveDisplayed(24, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Silus is dead
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Quest completed
AchievementsQuest.IncDaedricQuests()
AchievementsQuest.IncDaedricArtifacts()
SetObjectiveCompleted(75, 1)

;Dagon speaks one last time. Door opens
DA07DagonEndScene.Start()

Game.GetPlayer().additem(Razor, 1)

Utility.Wait(2)

Alias_Dremora01.GetActorRef().Enable(true)
Alias_Dremora02.GetActorRef().Enable(true)

utility.wait(3)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; Player is asked to bring the blade to Silus
SetObjectiveCompleted(12, 1)
SetObjectiveDisplayed(22, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
; Player is asked to bring the pommel stone to Silus
SetObjectiveCompleted(11, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Player enters the museum

;shut down the intro quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
;silius final forcegreet
Alias_Silus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Silus mentions Dagon
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Silus attempts to use the shrine
DA07SilusShrineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(11, 1)
SetObjectiveDisplayed(12, 1)
SetObjectiveDisplayed(14, 1)

;give the player map markers
pDeadCroneRockMapMarker.AddToMap()
pGularzMapMarker.AddToMap()
pMorthalMapMarker.AddToMap()

;give the player the notes on the Keepers of the Razor
Game.GetPlayer().AddItem(pKeepersNote, 1)

;Clear objectives if the player already has the pieces
If Game.GetPlayer().GetItemCount(Alias_RazorPommel.GetRef()) >= 1
  SetStage(20)
  kmyQuest.IncrementRazorCount()
EndIf

If Game.GetPlayer().GetItemCount(Alias_RazorBlade.GetRef()) >= 1
  SetStage(30)
  kmyQuest.IncrementRazorCount()
EndIf

If Game.GetPlayer().GetItemCount(Alias_RazorHilt.GetRef()) >= 1
  SetStage(40)
  kmyQuest.IncrementRazorCount()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
;Silus goes to the Shrine of Mehrunes' Dagon
SetObjectiveDisplayed(30, 1)

Alias_Silus.GetActorRef().EvaluatePackage()
Alias_ShrineMapMarker.GetRef().AddtoMap()

;disable scabbard
MuseumScabbardREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
;we moved Silus when he unloaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(75, 1)

;disable pieces
Alias_ReforgeTrigger.GetRef().Disable()
DA07AltarHiltREF.Disable()
DA07AltarBladeREF.Disable()
DA07AltarPommelREF.Disable()
DA07AltarScabbardREF.Disable()

;Play the animation and enable the Take trigger
Alias_Altar.GetRef().PlayAnimation("Reforge")
DA07RazorTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
;Player agrees to let Silus go
AchievementsQuest.IncDaedricQuests()
SetObjectiveFailed(50, 1)
DA07FIN.SetStage(10)

Actor SilusRef = Alias_Silus.GetActorRef()
SilusRef.SetRelationshipRank(Game.GetPlayer(), 1)
SilusRef.EvaluatePackage()

Game.GetPlayer().AddItem(Gold, 500)

;disable pieces
Alias_DagonSpeaksTrigger.GetRef().Disable()
DA07AltarHiltREF.Disable()
DA07AltarBladeREF.Disable()
DA07AltarPommelREF.Disable()
DA07AltarScabbardREF.Disable()

;Dagon speaks one last time. Door opens
DA07DagonRejectedScene.Start()

Utility.Wait(2)

Alias_Dremora01.GetActorRef().Enable(true)
Alias_Dremora02.GetActorRef().Enable(true)

;re-enable pieces in display case
MuseumScabbardREF.Enable()
MuseumPommelREF.Enable()
MuseumHiltREF.Enable()
MuseumBladeREF.Enable()

utility.wait(3)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
;player is told to speak to dagon
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

Alias_DagonSpeaksTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Enable shrine pieces
DA07AltarHiltREF.Enable()
DA07AltarBladeREF.Enable()
DA07AltarPommelREF.Enable()
DA07AltarScabbardREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;Silus becomes hostile
Actor SilusREF = Alias_Silus.GetActorRef()

SilusREF.AddtoFaction(DA07PlayerEnemyFaction)
SilusREF.SetAv("Aggression", 1)
SilusREF.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Silus offers player to take the tour
SetObjectiveDisplayed(10, 1)

;unlock Silus's house
Alias_SilusDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
; Player has given Silus the Blade
SetObjectiveCompleted(22, 1)
Game.GetPlayer().RemoveItem(Alias_RazorBlade.GetRef())

kmyquest.DecrementRazorCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Jorgen gives you the keys
Alias_Jorgen.GetActorRef().RemoveItem(JorgenHouseKey, 1)
Alias_Jorgen.GetActorRef().RemoveItem(DA07JorgenKey, 1)
Game.GetPlayer().AddItem(JorgenHouseKey, 1)
Game.GetPlayer().AddItem(DA07JorgenKey, 1)
MorthalJorganandLamisHouse.SetPublic()
Alias_JorgenChest.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE DA07QuestScript
Quest __temp = self as Quest
DA07QuestScript kmyQuest = __temp as DA07QuestScript
;END AUTOCAST
;BEGIN CODE
; Player has given Silus the Hilt
SetObjectiveCompleted(24, 1)
Game.GetPlayer().RemoveItem(Alias_RazorHilt.GetRef())

kmyquest.DecrementRazorCount()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ScabbardScene  Auto  

Scene Property PrayerScene  Auto  

Scene Property TrapScene  Auto  

Weapon Property Razor  Auto  

ObjectReference Property SilusPrayerMarker  Auto  

ObjectReference Property PlayerSacrificeMarker  Auto  

ObjectReference Property ValmirsChest  Auto  

ObjectReference Property ValmirHouseExterior  Auto  

Quest Property DA07Intro  Auto  

Scene Property pDA07TestScene  Auto  

Book Property pKeepersNote  Auto  

MiscObject Property Gold  Auto  

ObjectReference Property SilusChest  Auto  

ObjectReference Property pMorthalMapMarker  Auto  

ObjectReference Property pDeadCroneRockMapMarker  Auto  

ObjectReference Property pGularzMapMarker  Auto  

Scene Property pSilusFinalScene  Auto  

Key Property DA07JorgenKey  Auto  

Key Property JorgenHouseKey  Auto  

ObjectReference Property DA07AltarHiltREF  Auto  

ObjectReference Property DA07AltarPommelREF  Auto  

ObjectReference Property DA07AltarBladeREF  Auto  

ObjectReference Property DA07AltarScabbardREF  Auto  

Scene Property DA07DagonEndScene  Auto  

Scene Property Da07DagonRejectedScene  Auto  

Faction Property DA07PlayerEnemyFaction  Auto  

Quest Property DA07FIN  Auto  

ObjectReference Property ScabbardREF  Auto  

ObjectReference Property MuseumPommelREF  Auto  

ObjectReference Property MuseumHiltREF  Auto  

ObjectReference Property MuseumBladeREF  Auto  

ObjectReference Property MuseumScabbardREF  Auto  

Scene Property DA07SilusShrineScene  Auto  

ObjectReference Property DA07RazorTrigger  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Spell Property DA07SummonDremora  Auto  

VisualEffect Property SummonTargetVisualFX  Auto  

Sound Property MAGConjureFire  Auto  

Cell Property MorthalJorganandLamisHouse  Auto  
