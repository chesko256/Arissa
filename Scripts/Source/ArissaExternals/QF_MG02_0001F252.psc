;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname QF_MG02_0001F252 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MG02EnchantedItem01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItem01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02NerienAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02NerienAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02WallAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02WallAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02Stage20FGTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02Stage20FGTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02ArnielAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02ArnielAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02JzargoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02JzargoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02BrelynaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02BrelynaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02SavosArenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02SavosArenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirTunnelSceneTrigger2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirTunnelSceneTrigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EyeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EyeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirLectureTrigger1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirLectureTrigger1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TransitionDoorTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TransitionDoorTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirLectureTrigger3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirLectureTrigger3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02OnmundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02OnmundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02AmuletTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02AmuletTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EnchantedItemLocation01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItemLocation01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EnchantedItem02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItem02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirLectureTrigger2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirLectureTrigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EnchantedItemLocation03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItemLocation03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02SaarthalDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02SaarthalDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Saarthal02ExitDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Saarthal02ExitDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02AmuletAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02AmuletAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EnchantedItem03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItem03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirTunnelSceneTrigger1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirTunnelSceneTrigger1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02EnchantedItemLocation02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02EnchantedItemLocation02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MG02TolfdirStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MG02TolfdirStartMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
;Alias_MG02TolfdirAlias.GetReference().MoveTo(pMG02TolfdirStartMark)
Alias_MG02TolfdirAlias.GetActorReference().EvaluatePackage()
;Alias_MG02BrelynaAlias.GetReference().MoveTo(pMG02BrelynaStartMark)
Alias_MG02BrelynaAlias.GetActorReference().EvaluatePackage()
Alias_MG02BrelynaAlias.GetActorReference().GetActorBase().SetProtected(true)
;Alias_MG02OnmundAlias.GetReference().MoveTo(pMG02OnmundStartMark)
Alias_MG02OnmundAlias.GetActorReference().EvaluatePackage()
Alias_MG02OnmundAlias.GetActorReference().GetActorBase().SetProtected(true)
;Alias_MG02JzargoAlias.GetReference().MoveTo(pMG02JzargoStartMark)
Alias_MG02JzargoAlias.GetActorReference().EvaluatePackage()
Alias_MG02JzargoAlias.GetActorReference().GetActorBase().SetProtected(true)
Alias_MG02ArnielAlias.GetReference().MoveTo(MG02SaarthalArnielMarker)
Alias_MG02ArnielAlias.GetActorReference().EvaluatePackage()
if MG01.GetStage() < 200
MG01.SetStage(200)
Endif
DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript
DQScript.GateOpen=1
Game.GetPlayer().SetFactionRank(CollegeFaction, 0)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(25)==1
if IsObjectiveCompleted(25)==0
SetObjectiveDisplayed(25,0)
endif
endif
If IsObjectiveCompleted(20) == 0
SetObjectiveDisplayed(20,0)
endif

Alias_MG02TolfdirAlias.GetReference().MoveTo(MG02TolfdirAmuletMarker)
;TolfdirTunnelScene.Start()
kMyQuest.TrapCollisionToggle=1
CollisionWall01.Enable()
kMyQuest.RegisterforSingleUpdate(4.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(30,1)
TolfdirLectureScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;pMG02TestOrbMessage.Show()
;kMyQuest.OrbFound = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_MG02TolfdirAlias.GetReference().MoveTo(pMG02TolfdirStartMark)
Alias_MG02TolfdirAlias.GetActorReference().EvaluatePackage()
Alias_MG02BrelynaAlias.GetReference().MoveTo(pMG02BrelynaStartMark)
Alias_MG02BrelynaAlias.GetActorReference().EvaluatePackage()
Alias_MG02OnmundAlias.GetReference().MoveTo(pMG02OnmundStartMark)
Alias_MG02OnmundAlias.GetActorReference().EvaluatePackage()
Alias_MG02JzargoAlias.GetReference().MoveTo(pMG02JzargoStartMark)
Alias_MG02JzargoAlias.GetActorReference().EvaluatePackage()
Alias_MG02ArnielAlias.GetReference().MoveTo(MG02SaarthalArnielMarker)
Alias_MG02ArnielAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
TolfdirLectureScene.Start()
Alias_MG02SaarthalDoor.GetReference().Lock(False)
Alias_MG02OnmundAlias.GetActorReference().EvaluatePackage()
Alias_MG02BrelynaAlias.GetActorReference().EvaluatePackage()
Alias_MG02TolfdirAlias.GetActorReference().EvaluatePackage()
Alias_MG02JzargoAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().SetFactionRank(CollegeFaction,1)
Game.GetPlayer().Additem(StaffMagelight, 1)
Alias_MG02TolfdirAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardMedium.GetValueInt())
MGRAppBrelyna01.Start()
MGRAppJzargo01.Start()
MGRAppOnmund01.Start()
SaarthalLocation.Clear()
Stop()
MG03.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
SaarthalMapMarker.AddToMap(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(65,1)
SetObjectiveDisplayed(70,1)
ArchMageDoor1.Lock(false)
ArchMageDoor2.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MG02QuestScript
Quest __temp = self as Quest
MG02QuestScript kmyQuest = __temp as MG02QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(25)==1
if IsObjectiveCompleted(25)==0
SetObjectiveDisplayed(25,0)
endif
endif
If IsObjectiveCompleted(20) == 0
SetObjectiveDisplayed(20,0)
endif
kMyQuest.RegisterforUpdate(1.0)
Alias_MG02TolfdirAlias.GetReference().MoveTo(MG02TolfdirAmuletMarker)
kMyQuest.TrapCollisionToggle=1
CollisionWall01.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
LoopFX.PopTo(OutroFX,fImodStrength)
PSGD.Remove(1.0)
MGTeleportOutEffect.Play(Alias_MG02NerienAlias.GetReference())
Utility.Wait(1.0)
Alias_MG02NerienAlias.GetActorReference().SetAlpha(0,true)
Utility.Wait(1.0)
Alias_MG02NerienAlias.GetReference().Disable()
MG02MonkSceneQuest.Stop()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)

;Alias_MG02TolfdirAlias.GetActorReference().EnableAI()
;Alias_MG02TolfdirAlias.GetReference().BlockActivation(false)
Alias_MG02TolfdirAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(25,1)
pMG02TolfdirInstructionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property pMG02TestOrbMessage auto
Scene Property pMG02VisionScene auto
Scene Property pMG02TolfdirInstructionScene auto
ObjectReference Property pMG02TolfdirStartMark auto
ObjectReference Property pMG02OnmundStartMark auto
ObjectReference Property pMG02BrelynaStartMark auto
ObjectReference Property pMG02JzargoStartMark auto

quest Property MG03  Auto  

ObjectReference Property MG02TolfdirAmuletMarker  Auto  

ObjectReference Property MG02SaarthalArnielMarker  Auto  

Scene Property TolfdirLectureScene  Auto  

Scene Property TolfdirTunnelScene  Auto  

Quest Property MGDialogueQuest  Auto  

ObjectReference Property SaarthalMapMarker  Auto  

Faction Property CollegeFaction  Auto  

ObjectReference Property CollisionWall01  Auto  

Quest Property MG01  Auto  

Quest Property MGRAppBrelyna01  Auto  

Quest Property MGRAppOnmund01  Auto  

Quest Property MGRAppJzargo01  Auto  

weapon Property staffmagelight  Auto  

Quest Property MG02MonkSceneQuest  Auto  

ImageSpaceModifier Property LoopFX  Auto  

ImageSpaceModifier Property IntroFX  Auto  

ImageSpaceModifier Property OutroFX  Auto  

float Property fImodStrength  Auto  

VisualEffect Property MGTeleportOutEffect  Auto  

ShaderParticleGeometry Property PSGD  Auto  

ObjectReference Property ArchMageDoor1  Auto  

ObjectReference Property ArchMageDoor2  Auto  

LocationAlias Property SaarthalLocation  Auto  
