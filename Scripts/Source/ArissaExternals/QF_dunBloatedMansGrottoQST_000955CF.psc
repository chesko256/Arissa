;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 44
Scriptname QF_dunBloatedMansGrottoQST_000955CF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hunter01_Mazgak
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter01_Mazgak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SindingWontLeaveTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SindingWontLeaveTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA05CollisionEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DA05CollisionEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter01_Tsrasuna
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter01_Tsrasuna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02_Yar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter02_Yar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EndEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MainEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MainEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter03_Jsava
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter03_Jsava Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02_Eriana
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter02_Eriana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SindingMakeFriendsTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SindingMakeFriendsTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter03_Thjollod
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter03_Thjollod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter00_JKier
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter00_JKier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter03_Heratar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter03_Heratar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02_Viding
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter02_Viding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter01_Rissing
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter01_Rissing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sinding
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sinding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter03_Ahjisi
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter03_Ahjisi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StartEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02_Torkild
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter02_Torkild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SindingStartPosition
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SindingStartPosition Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has learned that Sinding attacked the hunters' camp. Kills JKier.
Alias_Hunter00_JKier.GetActorReference().Kill()
DA05.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
{Kill Sinding Path -- #1a. Sinding runs for the first combat zone.}

;Update factions.
(Alias_Sinding As dunBloatedManSindingScript).IsTryingToSaveSinding = False
Alias_Sinding.GetActorReference().GetActorBase().SetEssential(false)
Alias_Sinding.GetActorReference().GetActorBase().SetProtected(true)
SindingFaction.SetAlly(PlayerFaction, 1)
HunterFaction.SetAlly(PlayerFaction, 1)

;Update aggression.
Alias_Sinding.GetActorReference().SetAV("Aggression", 2)
Alias_Sinding.GetActorRef().SetAV("Variable06", 1)

;Sinding runs into the shrine.
Alias_Sinding.GetActorReference().EvaluatePackage()

;Sinding waits to ally with the player.
Alias_Sinding.GetActorReference().GetActorBase().SetEssential(false)
Alias_Sinding.GetActorReference().GetActorBase().SetProtected(true)


;Enable Kill Sinding path hunters, then weaken them.
Alias_Hunter01_Rissing.GetReference().Enable()
Alias_Hunter01_Mazgak.GetReference().Enable()
Alias_Hunter01_Tsrasuna.GetReference().Enable()

Alias_Hunter02_Eriana.GetReference().Enable()
Alias_Hunter02_Yar.GetReference().Enable()
Alias_Hunter02_Torkild.GetReference().Enable()
Alias_Hunter02_Viding.GetReference().Enable()

Alias_Hunter03_Ahjisi.GetReference().Enable()
Alias_Hunter03_Heratar.GetReference().Enable()
Alias_Hunter03_Thjollod.GetReference().Enable()
Alias_Hunter03_JSava.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
{Save Sinding Path -- #1b. Sinding begins to follow the player.}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Sinding dies.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
{FAILSAFE. If the player sides with Sinding, then begins attacking him, this stage determines how to flip over to the Kill Sinding path.}

;Get DA05's objectives back into a usable state.
DA05.SetStage(60)
DA05.SetObjectiveFailed(70, False)

;Update factions.
Alias_Sinding.GetActorRef().SetAV("Variable06", 1)
(Alias_Sinding As dunBloatedManSindingScript).IsTryingToSaveSinding = False
SindingFaction.SetEnemy(PlayerFaction)
HunterFaction.SetEnemy(PlayerFaction, 1)

;Clean up Sinding's packages.
Alias_SindingWontLeaveTrigger.GetReference().Disable()
Alias_SindingMakeFriendsTrigger.GetReference().Disable()

;Trigger betrayal DLG.
if (GetStage() < 40)
   SindingPreAttack.Start()
Else
   SindingBetrayedScene.Start()
EndIf


if (GetStage() < 50)
   ;Prior to Combat 1, let Stage 45 take over.
   SetStage(45)
ElseIf (GetStage() < 60)
   ;During Combat 1, Sinding flees.
   SetStage(45)
   SetStage(55)
   SetStage(56)
ElseIf (GetStage() < 70)
   ;During Combat 2, Sinding flees.
   SetStage(45)
   SetStage(55)
   SetStage(56)
   SetStage(65)
   SetStage(66)
Else
   ;During Combat 3, Sinding just attacks.
   SetStage(45)
   SetStage(55)
   SetStage(56)
   SetStage(65)
   SetStage(66)
   SetStage(75)
   SetStage(76)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Flag -- Release Sinding to attack the third group of hunters.
Alias_Sinding.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quickstart for Bloated Man's Grotto testing.
;Setup DA05
DA05.SetStage(0)
DA05.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
{Save Sinding Path -- #3a. Start the third combat with the hunters.}
Alias_Hunter03_Ahjisi.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_Ahjisi.GetActorRef().EvaluatePackage()
Alias_Hunter03_Heratar.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_Heratar.GetActorRef().EvaluatePackage()
Alias_Hunter03_Thjollod.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_Thjollod.GetActorRef().EvaluatePackage()
Alias_Hunter03_JSava.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_JSava.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
{Kill Sinding Path -- #4a. Start final combat with the hunters.}
Alias_Hunter03_Ahjisi.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_Heratar.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_Thjollod.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter03_JSava.GetActorRef().RemoveFromFaction(HunterStallFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
{Removes the bloodmoon effect and cleans up the Grotto.}
BloodmoonWeatherMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
{Clear out the Hunters of Hircine when DA05 finishes.}
Alias_EndEnableMarker.GetReference().Disable()
Alias_Hunter01_Rissing.GetReference().Disable()
Alias_Hunter01_Mazgak.GetReference().Disable()
Alias_Hunter01_Tsrasuna.GetReference().Disable()

Alias_Hunter02_Eriana.GetReference().Disable()
Alias_Hunter02_Yar.GetReference().Disable()
Alias_Hunter02_Torkild.GetReference().Disable()
Alias_Hunter02_Viding.GetReference().Disable()

Alias_Hunter03_Ahjisi.GetReference().Disable()
Alias_Hunter03_Heratar.GetReference().Disable()
Alias_Hunter03_Thjollod.GetReference().Disable()
Alias_Hunter03_JSava.GetReference().Disable()

if (DA05.GetStageDone(100))
   Alias_Sinding.GetActorRef().Disable()
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Flag -- Release Sinding to attack the second group of hunters.
Alias_Sinding.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
{Kill Sinding Path -- #3b. Sinding escapes the second battle.}
Alias_Sinding.GetActorReference().EvaluatePackage()
Alias_Hunter02_Eriana.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter02_Eriana.GetActorRef().EvaluatePackage()
Alias_Hunter02_Yar.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter02_Yar.GetActorRef().EvaluatePackage()
Alias_Hunter02_Torkild.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter02_Torkild.GetActorRef().EvaluatePackage()
Alias_Hunter02_Viding.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter02_Viding.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player bypasses JKier. Kills JKier if he wasn't dead already.
Alias_Hunter00_JKier.GetActorReference().Kill()
Alias_Sinding.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Trigger Sinding Greet scene.
GreetScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
{Kill Sinding Path -- #4c. Sinding final combat.}
SindingFaction.SetEnemy(PlayerFaction)
SindingFinalScene.Start()
Alias_Sinding.GetActorReference().EvaluatePackage()
Alias_Hunter03_Ahjisi.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter03_Ahjisi.GetActorRef().EvaluatePackage()
Alias_Hunter03_Heratar.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter03_Heratar.GetActorRef().EvaluatePackage()
Alias_Hunter03_Thjollod.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter03_Thjollod.GetActorRef().EvaluatePackage()
Alias_Hunter03_JSava.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter03_JSava.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Trigger Sinding's forcegreet.
GreetScene.Stop()
Alias_DA05CollisionEnableMarker.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
{Save Sinding Path -- #1a. Sinding waits for the player.}

;Update Aggression & Factions.
Alias_Sinding.GetActorReference().SetAV("Aggression", 1)
HunterFaction.SetEnemy(PlayerFaction)

;Sinding waits to ally with the player.
Alias_Sinding.GetActorReference().GetActorBase().SetEssential(false)
Alias_Sinding.GetActorReference().GetActorBase().SetProtected(true)

;Enable Save Sinding path hunters.
Alias_Hunter01_Rissing.GetReference().Enable()
Alias_Hunter01_Mazgak.GetReference().Enable()
Alias_Hunter01_Tsrasuna.GetReference().Enable()

Alias_Hunter02_Eriana.GetReference().Enable()
Alias_Hunter02_Yar.GetReference().Enable()
Alias_Hunter02_Torkild.GetReference().Enable()
Alias_Hunter02_Viding.GetReference().Enable()

Alias_Hunter03_Ahjisi.GetReference().Enable()
Alias_Hunter03_Heratar.GetReference().Enable()
Alias_Hunter03_Thjollod.GetReference().Enable()
Alias_Hunter03_JSava.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
{Save Sinding Path -- #3a. Second combat with hunters.}
Alias_Hunter02_Eriana.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Eriana.GetActorRef().EvaluatePackage()
Alias_Hunter02_Yar.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Yar.GetActorRef().EvaluatePackage()
Alias_Hunter02_Torkild.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Torkild.GetActorRef().EvaluatePackage()
Alias_Hunter02_Viding.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Viding.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
{Save Sinding Path -- #2a. Start first combat with hunters.}
Alias_Hunter01_Rissing.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter01_Rissing.GetActorRef().EvaluatePackage()
Alias_Hunter01_Mazgak.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter01_Mazgak.GetActorRef().EvaluatePackage()
Alias_Hunter01_Tsrasuna.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter01_Tsrasuna.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Set up initial state of the Grotto during DA05.
Alias_MainEnableMarker.GetReference().Enable()
Alias_StartEnableMarker.GetReference().Enable()
Alias_EndEnableMarker.GetReference().Enable()
Alias_DA05CollisionEnableMarker.GetReference().Enable()
BloodmoonWeatherMarker.Enable()
Alias_Sinding.GetReference().MoveTo(Alias_SindingStartPosition.GetReference())
;(Alias_Hunter00_JKier as dunSetRestrainedWhenSeated).SetRestrained(True)

(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter01_Mazgak.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter01_Tsrasuna.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter02_Torkild.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter02_Viding.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter02_Yar.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter03_Ahjisi.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter03_Heratar.GetReference())
(DA05 as DA05QuestScript).RegisterAdditionalHunter(Alias_Hunter03_Thjollod.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
{Kill Sinding Path -- #2b. Sinding flees the first battle.}
Alias_Sinding.GetActorReference().EvaluatePackage()
Alias_Hunter01_Rissing.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter01_Rissing.GetActorRef().EvaluatePackage()
Alias_Hunter01_Mazgak.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter01_Mazgak.GetActorRef().EvaluatePackage()
Alias_Hunter01_Tsrasuna.GetActorRef().SetAV("Variable06", 1)
Alias_Hunter01_Tsrasuna.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
{Kill Sinding Path -- #3a. Sinding attacks the second group of hunters.}
Alias_Hunter02_Eriana.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Yar.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Torkild.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter02_Viding.GetActorRef().RemoveFromFaction(HunterStallFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Flag -- Make sure the player at least sees Sinding before he runs off to the second combat.
(KillSindingCombat1Counter as defaultCounter).Increment()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
{Kill Sinding Path -- #2a. Sinding attacks the first group of hunters.}
Alias_Hunter01_Rissing.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter01_Mazgak.GetActorRef().RemoveFromFaction(HunterStallFaction)
Alias_Hunter01_Tsrasuna.GetActorRef().RemoveFromFaction(HunterStallFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA05  Auto  

Faction Property SindingFaction  Auto  

Faction Property HunterFaction  Auto  

Faction Property PlayerFaction  Auto  

Scene Property Hunters1 Auto
Scene Property Hunters2 Auto
Scene Property Hunters3 Auto

Actor Property RissingWeakened  Auto  

Actor Property ErianaWeakened  Auto  

Scene Property GreetScene  Auto  

Scene Property IdeaScene  Auto  

Scene Property SindingPreAttack  Auto  

Scene Property SindingFinalScene  Auto  

Scene Property SindingBetrayedScene  Auto  

Faction Property HunterStallFaction  Auto  

ObjectReference Property BloodmoonWeatherMarker  Auto  

ObjectReference Property KillSindingCombat1Counter  Auto  
