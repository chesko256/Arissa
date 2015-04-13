;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 90
Scriptname QF_DA10_00022F08 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MainDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MainDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RustyMaceStatic
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RustyMaceStatic Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Yngvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Yngvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MarkarthLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AltarofMolagBal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AltarofMolagBal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA10ReanimateCasterRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA10ReanimateCasterRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRustyMaceChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRustyMaceChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RustyMace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RustyMace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RustyMaceIntRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RustyMaceIntRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaptiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Logrolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Logrolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AbandonedHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AbandonedHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaceOfMolagBal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MaceOfMolagBal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tyranus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tyranus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRustyMace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRustyMace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MolagBalFinalTalking
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MolagBalFinalTalking Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RustyMaceTriggerREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RustyMaceTriggerREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MolagBalVoiceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MolagBalVoiceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;Tyranus tells player to open the door
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Player enters the house with Tyranus inside

;Kick off house scene
;pHouseHauntingScene.Start()
Alias_MainDoor.GetRef().Lock()

;remove Tyranus from his crime faction
Alias_Tyranus.GetActorRef().SetCrimeFaction(None)
Alias_Tyranus.GetActorRef().RemoveFromFaction(CrimeFactionReach)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Logrolf runs to the shrine
SetObjectiveCompleted(35, 1)
SetObjectiveDisplayed(40, 1)

DA10LogrolfMolagBalScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
;Player is told to kill Logrolf

;Make Logrolf Non-Essential
Alias_Logrolf.GetActorRef().GetActorBase().SetEssential(False)

SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
;Player gets past the bookshelf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;complete the quest
AchievementsQuest.IncDaedricQuests()
SetObjectiveCompleted(70, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Cue knock
If GetStageDone(70) == 0
  DA10HauntingController.SetStage(10)
EndIf

;failsafe lock the door
Alias_MainDoor.GetRef().Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Player attempts to open the basement door
If GetStageDone(70) == 0
  DA10HauntingController.SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;Haunting begins
pHauntingKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Player tries the front door
If GetStageDone(70) == 0
  DA10HauntingController.SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
;Molag Bal traps the player
Alias_MaceofMolagBal.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN CODE
;Logrolf goes into Bleedout
DA10LogrolfMolagBalScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Player agrees to help Molag Bal
Alias_MaceofMolagBal.UnRegisterForUpdate()

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

;Molag Bal lets the player go
Game.EnablePlayerControls()
Alias_Altar.GetRef().PlayAnimation("Down")
Alias_RustyMaceIntREF.GetRef().Disable()
DA10HauntingController.SetStage(90)

;Unlock the doors
Alias_MainDoor.GetRef().Lock(False)

;Disable static bed/ enable non static bed
DA10NonStaticBedEnabler.enable()

;Move and enable Logrolf
Alias_Logrolf.GetActorRef().Moveto(Alias_CaptiveMarker.GetRef())
Alias_Logrolf.GetActorRef().Enable()
Alias_Logrolf.GetActorRef().PlaceatMe(BoundCaptiveMarker)
Alias_Logrolf.GetActorRef().SetRestrained(1)

Alias_MapMarker.GetRef().AddtoMap()

Utility.Wait(2)
Alias_Altar.GetRef().BlockActivation()
Game.GetPlayer().PlayIdle(IdleCowerExit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Tyranus is dead
;make sure no one outside cares
Game.GetPlayer().StopCombatAlarm()
DA10HauntingController.SetStage(80)

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

;Molag Bal scene
pMolagBalStatueScene01.Start()

;unlock basement
Alias_BasementDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Tyranus attacks the player
Alias_Tyranus.GetActorRef().AddtoFaction(pPlayerEnemyFaction)
Alias_Tyranus.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
Alias_Tyranus.GetActorRef().EvaluatePackage()

;Tyranus goes inside
pHouseEntryScene.Start()

;Tyranus is no longer essential
Alias_Tyranus.GetActorRef().GetActorBase().SetEssential(false)

;unlock the doors
Alias_MainDoor.GetRef().Lock(False)
Alias_Altar.GetRef().SetNoFavorAllowed()
Alias_MaceofMolagBal.GetRef().SetNoFavorAllowed()
Alias_RustyMaceTriggerREF.GetRef().SetNoFavorAllowed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
;Logrolf unloaded so we just move him
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
;Logrolf is dead

SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

Alias_Altar.GetRef().PlayAnimation("Down")
;Alias_AltarofMolagBal.GetRef().Activate(Game.GetPlayer())

;until the Rusty Mace is unequipped, try to unequip and remove it
While (Game.GetPlayer().GetEquippedWeapon() == DA10RustyMace)
  Game.GetPlayer().UnequipItem(DA10RustyMace, abPreventEquip= True, abSilent=True)
  Utility.Wait(1)
EndWhile

Game.GetPlayer().RemoveItem(DA10RustyMace, 1)

;give the player the mace of molag bal
Game.GetPlayer().AddItem(DA10MaceOfMolagBal, 1)
Game.GetPlayer().EquipItem(DA10MaceOfMolagBal)
AchievementsQuest.IncDaedricArtifacts()

Utility.Wait(1)

;Molag Bal speaks one more time
Alias_MolagBalFinalTalking.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
; you killed Tyranus before he entered the house
Alias_MainDoor.GetRef().Lock()
SetObjectiveFailed(10, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_84
Function Fragment_84()
;BEGIN CODE
;Player is told to beat up Logrolf
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

;Give player the mace
Alias_RustyMaceStatic.GetRef().Disable()
Alias_MaceofMolagBal.GetRef().Disable()
Game.GetPlayer().AddItem(Alias_PlayerRustyMace.GetRef())
Game.GetPlayer().EquipItem(DA10RustyMace)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;Tyranus tells the player to try the main door
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; you killed Logrolf before he is at the altar
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;Logrolf allows you to free him
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
;Tyranus runs
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
;Player gets past the basement door
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_82
Function Fragment_82()
;BEGIN CODE
;Logrolf is at the Altar
Alias_Altar.GetRef().PlayAnimation("Up")
;Alias_AltarofMolagBal.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;turn off lights
;DA10HauntingController.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
Alias_Yngvar.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;Logrolf dies (the first time)
Actor pLogrolf = Alias_Logrolf.GetActorRef()
DA10LogrolfMolagBalScene02.Start()
;Make Logrolf Essential
Alias_Logrolf.GetActorRef().GetActorBase().SetEssential(True)

;blur to cover up the resurrect
DA10ResurrectBlurAnimated.Apply()
utility.wait(1)
;DA10ReanimateTargetFX.Play(pLogrolf)
DA10SummonValorTargetFX.play(pLogrolf, 10)
utility.wait(0.5)
Alias_Logrolf.GetActorRef().Resurrect()



;OLD SCRIPT
;DA10ReanimateCaster myCaster = (alias_DA10ReanimateCasterRef.getReference() as DA10ReanimateCaster)

;myCaster.mytarget = (alias_Logrolf.getactorReference())
;Utility.Wait(0.5)
;alias_DA10ReanimateCasterRef.getReference().activate(alias_DA10ReanimateCasterRef.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;pTyranusHouseScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_89
Function Fragment_89()
;BEGIN CODE
Alias_Tyranus.GetActorRef().Enable()
Alias_Tyranus.GetActorRef().Moveto(DA10TyranusMarkerREF)
Alias_Yngvar.GetActorRef().EvaluatePackage()
Alias_Yngvar.GetActorRef().Moveto(DA10YngvarMarkerREF)

DA10StartScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;slam door
If GetStageDone(70) == 0
  DA10HauntingController.SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
;Heading back upstairs
If GetStageDone(70) == 0
  DA10HauntingController.SetStage(60)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

Scene Property LogrolfMolagScene  Auto  

Weapon Property RustyMace  Auto  

MiscObject Property TorturePlans  Auto  

ObjectReference Property MarkarthCenter  Auto  

Scene Property DA10EndScene  Auto  

Scene Property AttachMachineScene  Auto  

Scene Property MolagBalScene02  Auto  

Key Property pLogrolfHouse  Auto  

ObjectReference Property pBoethiahDoor  Auto  

Scene Property pLogrolfForcegreetScene  Auto  

Scene Property pHouseEntryScene  Auto  

Scene Property pHouseHauntingScene  Auto  

Keyword Property pHauntingKeyword  Auto  

Scene Property pMainDoorScene  Auto  

Scene Property pTyranusFollowPlayer  Auto  

Scene Property pTyranusHouseScene01  Auto  

Scene Property pBasementDoorScene  Auto  

Key Property pBasementKey  Auto  

Scene Property HouseTyranusScene02  Auto  

Quest Property pHauntingQuest  Auto  

Faction Property pPlayerEnemyFaction  Auto  

Scene Property pMolagBalStatueScene01  Auto  

MiscObject Property pPainExtensor  Auto  

Faction Property pCrimeFactionReach  Auto  

Quest Property pDA10FIN  Auto  

Scene Property pTyranusForcegreetScene  Auto  

Scene Property pLogrolfHitScene  Auto  

Scene Property DA10StartScene  Auto  

Quest Property DA10HauntingController  Auto  

Furniture Property BoundCaptiveMarker  Auto  

Scene Property DA10LogrolfMolagBalScene02  Auto  

Scene Property DA10LogrolfMolagBalScene01  Auto  

Scene Property DA10LogrolfMolagBalScene03  Auto  

Weapon Property DA10MaceofMolagBal  Auto  

Weapon Property DA10RustyMace  Auto  

ObjectReference Property DA10TyranusMarkerREF  Auto  

ObjectReference Property DA10YngvarMarkerREF  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Idle Property IdleExitFurniture  Auto  

VisualEffect Property DA10ReanimateTargetFX  Auto  

Idle Property IdleCowerExit  Auto  

Faction Property CrimeFactionReach  Auto  

VisualEffect Property DA10SummonValorTargetFX  Auto  

ImageSpaceModifier Property DA10RessurectBlurAnimated  Auto  

ImageSpaceModifier Property DA10ResurrectBlurAnimated  Auto  

ObjectReference Property DA10NonStaticBedEnabler  Auto  
