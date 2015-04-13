;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_MS06Start_00093807 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS06Melaran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Melaran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06RitualScene1Trigger1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06RitualScene1Trigger1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06SybelleStentor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06SybelleStentor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Cultist1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Cultist1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06FalkNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06FalkNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfskullCaveMapmarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfskullCaveMapmarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06TowerTopTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06TowerTopTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Styrr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Styrr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06VarniusJunius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06VarniusJunius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Erikur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Erikur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06HeadNecromancer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06HeadNecromancer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06FalkFirebeard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06FalkFirebeard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Cultist3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Cultist3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Potema
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Potema Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Wolfskull02Exit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Wolfskull02Exit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06WolfskullQTHandOff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06WolfskullQTHandOff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06TestingStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06TestingStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06BolgeirBearclaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06BolgeirBearclaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06RitualScene2Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06RitualScene2Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfskullCaveAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_WolfskullCaveAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06StartIntroTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06StartIntroTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Cultist2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Cultist2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Wolfskull01Exit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Wolfskull01Exit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06RitualScene1Trigger2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06RitualScene1Trigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Bryling
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Bryling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemasCatacombsBossAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PotemasCatacombsBossAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06RitualEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06RitualEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Cultist4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Cultist4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemasCatacombsAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_PotemasCatacombsAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSkull_State_Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfSkull_State_Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfskullCaveBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfskullCaveBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06PotemaEffect
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06PotemaEffect Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Odar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Odar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Erdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Erdi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06RitualScene3Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06RitualScene3Trigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
setObjectiveDisplayed(10) ; Ask Falk Firebeard about Wolfskull Cave.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Scene 4: Potema Escapes, triggered when the necromancers are dead or the book is taken.
Alias_MS06PotemaEffect.GetRef().PlayAnimation("TransitionAnim")
MS06StartPotemaEscapesScene.start()
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Objective to return to Falk

setObjectiveCompleted(50)      ;Investigate Wolfskull Caverns.
setObjectiveDisplayed(100)      ;Speak to Falk Firebeard

;Weather_Storm.forceActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Sybille Stentor has forcegreeted player -- or player has managed to sneak by her to Falk :(
;Maid screams.
;BystanderScene.Start()

;kmyQuest.MaidScream = 1
;Check out MS06Script
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;For testing purposes only, moves the player to the blue palace and activates the necromancers.
Game.GetPlayer().moveto(Alias_MS06TestingStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_14 in script QF_MS06Start_00093807
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Player reaches ritual, head necromancer orders attack, last two necromancers break from packages.

MS06startTopOfTowerScene.Start()
alias_MS06Cultist1.GetActorRef().StartCombat(Game.GetPlayer())
alias_MS06Cultist2.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Triggered by MS06QuestStartTriggerAlias in the blue palace. Scene leads in to stage 10.
MS06StartAppealForHelpScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;trigger starts Scene 1:Summoning
MS06StartRitualScene1.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
setObjectiveCompleted(10)      ;Ask Falk Firebeard about Wolfskull Caverns.
setObjectiveDisplayed(50)        ;Investigate Wolfskull Caverns.
alias_MS06RitualEnabler.GetRef().Enable()
;alias_MS06StartPotemaEnabler.GetRef().Enable()
Alias_WolfSkull_State_Marker.getRef().enable()
Alias_WolfskullCaveMapmarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Scene 2:Summoning has ended wait for new trigger.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;trigger starts Scene 2:Binding Begins
MS06StartRitualScene2.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;trigger starts Scene 3:Binding Interrupted.
;Necromancers are freed from their "no combat" packages.
MS06StartRitualScene3.start()
;MS06CultistSceneFaction.SetEnemy( PlayerFaction )
;MS06CultistSceneFaction.setAlly( MS06CultistFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player has spoken to Falk, quest complete.
AchievementsQuest.IncSideQuests()
setobjectivecompleted(100)
Alias_MS06Jarl.GetActorRef().SetRelationshipRank(Game.GetPlayer(),1)
Alias_MS06FalkFirebeard.GetActorRef().SetRelationshipRank(Game.GetPlayer(),1)
game.getplayer().additem(Lvlquestreward02medium)

;If (Game.GetPlayer().GetLevel()) >= 10
;         Alias_MS06FalkNote.GetRef().Enable()
;          (CourierQuest as WICourierScript).AddItemToContainer(Alias_MS06FalkNote.GetRef())
;EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Set after the initial scene with Varnius
MS06Rumor.Setstage(20)
alias_MS06VarniusJunius.GetActorRef().GetActorBase().SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Scene 1:Summoning has ended wait for new trigger.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player has attacked the Necromancer Leader
alias_MS06HeadNecromancer.GetActorRef().EvaluatePackage()
alias_MS06HeadNecromancer.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Bystander scene has ended. Falk Forcegreets.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property MS06StartAppealForHelpScene  Auto  

scene Property MS06StartRitualScene1  Auto  

scene Property MS06StartRitualScene2  Auto  

scene Property MS06StartRitualScene3  Auto  

scene Property MS06StartPotemaEscapesScene  Auto  

quest Property MS06  Auto  

Weather Property Weather_Storm  Auto  

Quest Property CourierQuest  Auto  

Scene Property MS06StartTopOfTowerScene  Auto  

Quest Property MS06Rumor  Auto  

AchievementsScript Property AchievementsQuest  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  
