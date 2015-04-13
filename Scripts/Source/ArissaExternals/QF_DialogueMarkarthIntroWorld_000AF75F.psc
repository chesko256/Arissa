;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DialogueMarkarthIntroWorld_000AF75F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Eltrys
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Eltrys Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hogni
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hogni Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Weylin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Weylin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Margret
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Margret Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kerah
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kerah Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Clean up bodies
MS01.MarkarthMarket = 0

If Alias_Weylin.GetActorRef().IsDead() == True
  Alias_Weylin.GetActorRef().Delete()
EndIf

If Alias_Margret.GetActorRef().IsDead() == True
  Alias_Margret.GetActorRef().Delete()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Weylin has attempted to kill Margret

;if Alias_Weylin.GetActorRef().PlayIdleWithTarget(KillMove, Alias_Margret.GetActorRef())
; ;  Debug.Trace(self + "Weylin plays his backstab animation")
;else
; ;  Debug.Trace(self + "Weylin's paired animation failed to play")
;endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Weylin.GetActorRef().AddtoFaction(MS01EnemyFaction)
Alias_Kerah.GetActorRef().StartCombat(Alias_Weylin.GetActorRef())
Alias_Hogni.GetActorRef().StartCombat(Alias_Weylin.GetActorRef())

;Markarth is shut down until bodies are cleared
MS01Script.MarkarthMarket = 1

; un-ghost actors
Alias_Kerah.GetActorRef().SetGhost(false)
Alias_Hogni.GetActorRef().SetGhost(false)
;Alias_Weylin.GetActorRef().SetGhost(false)
Alias_Margret.GetActorRef().SetGhost(false)
Alias_Guard.GetActorRef().SetGhost(false)
Alias_Eltrys.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Weylin dies
; debug.trace(self + "Starting MS01 post market attack scene")
MarkarthIntroEndCombatScene.Start()
Game.GetPlayer().RemoveFromFaction(GuardFactionMarkarth)
Alias_Margret.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;run the scene
pIntroScene.Start()

Alias_Weylin.GetActorRef().RemoveFromFaction(CrimeFactionReach)
Alias_Weylin.GetActorRef().RemoveFromFaction(TownMarkarthFaction)

;Temporarily add the player to the guard faction until Weylin dies
;Game.GetPlayer().AddtoFaction(GuardFactionMarkarth)

;ghost actors so that crime isn't called if the player assaults NPCs
Alias_Kerah.GetActorRef().SetGhost()
Alias_Hogni.GetActorRef().SetGhost()
;Alias_Weylin.GetActorRef().SetGhost()
Alias_Margret.GetActorRef().SetGhost()
Alias_Guard.GetActorRef().SetGhost()
Alias_Eltrys.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MS01IntroWorldSceneScript
Quest __temp = self as Quest
MS01IntroWorldSceneScript kmyQuest = __temp as MS01IntroWorldSceneScript
;END AUTOCAST
;BEGIN CODE
Alias_Eltrys.GetActorRef().EvaluatePackage()

kmyquest.RegisterForUpdateGameTime(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; people should go about their normal lives
Alias_Guard.GetActorRef().EvaluatePackage()
Alias_Guard02.GetActorRef().EvaluatePackage()
Alias_Guard03.GetActorRef().EvaluatePackage()
Alias_Kerah.GetActorRef().EvaluatePackage()
Alias_Margret.GetActorRef().EvaluatePackage()
Alias_Hogni.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pIntroScene  Auto  

Faction Property MS01EnemyFaction  Auto  

Faction Property CrimeFactionReach  Auto  

Faction Property TownMarkarthFaction  Auto  

Faction Property GuardFactionMarkarth  Auto  

Scene Property MarkarthIntroEndCombatScene  Auto  

Faction Property MS01WeylinKillMargretFaction  Auto  

MS01QuestScript Property MS01Script  Auto  

MS01QuestScript Property MS01  Auto  

Idle Property KillMove  Auto  
