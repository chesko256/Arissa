;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_VC01_0005C625 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS05Falion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Falion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05SummoningCircleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05SummoningCircleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05FalionsSoulGem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05FalionsSoulGem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VC01StartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VC01StartMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
setObjectiveCompleted(185)
AchievementsQuest.IncSideQuests()
(PlayerVampireQuest as PlayerVampireQuestScript).VampireCure(Game.Getplayer())
Alias_MS05Falion.GetActorRef().RemoveItem(Alias_MS05FalionsSoulGem.GetRef())
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Debug.MessageBox("You have contracted Vampirism.")
;put add vampirism here when it works and remove setstage 50
;Game.GetPlayer().moveto(Alias_VC01StartMarker.GetRef())
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player buys Black Soul Gem from Falion
Alias_MS05Falion.GetActorRef().RemoveItem(Alias_MS05FalionsSoulGem.GetRef())
Game.GetPlayer().AddItem(Alias_MS05FalionsSoulGem.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed (100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(100)
setObjectiveDisplayed (150)
game.getplayer().removeitem(BlackSoulGem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveCompleted(175)
setObjectiveDisplayed (185)
Scene_VC01VampirismCureRitual.Start()
Alias_MS05Falion.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
setObjectiveDisplayed (50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Ritual is complete.

Alias_MS05Falion.GetReference().Say(VC01RitualcompleteDialogueTopic)
Utility.Wait(1)
Setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Falion at clearing.
setObjectiveCompleted(150)
setObjectiveDisplayed (175)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Scene_VC01VampirismCureRitual  Auto  

SoulGem Property BlackSoulGem  Auto  

Quest Property PlayerVampireQuest  Auto  

AchievementsScript Property AchievementsQuest Auto

Topic Property VC01RitualCompleteDialogueTopic  Auto  
