;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_MS05DUPLICATE000_00053511 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS05Giraud
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Giraud Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05BookOfKingOlaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05BookOfKingOlaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Heimvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Heimvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Jorn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Jorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05ElisifTheFair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05ElisifTheFair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05GeneralTullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05GeneralTullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Erikur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Erikur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Bolgeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Bolgeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Viarmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Viarmo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05CourtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05CourtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Effigy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Effigy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Falk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Falk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Sybelle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Sybelle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Erdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Erdi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Meleran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Meleran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05FestivalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05FestivalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05Odar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05Odar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05DeadMansRespiteMapmarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05DeadMansRespiteMapmarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
setObjectiveCompleted(125)
setObjectiveDisplayed (135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Placeholder while Jorn greets the player.
setObjectiveCompleted(175)
setObjectiveDisplayed (250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
setObjectiveCompleted(135)
setObjectiveDisplayed (150)
MS05CourtScene.Start()

;Wrap up the dungeon quest.
MS05DungeonQuest.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
setObjectiveCompleted(75)
setObjectiveDisplayed (100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
setObjectiveCompleted(255)
setObjectiveDisplayed (260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
setObjectiveCompleted(250)
setObjectiveDisplayed (253)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Stage set if the player already have King Olaf's Verse when they acquire the quest.
MS05Rumor.setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveCompleted(150)
setObjectiveDisplayed (175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;No longer used
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
setObjectiveCompleted(200)
setObjectiveDisplayed (225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveCompleted(175)
setObjectiveDisplayed (200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE MS05QuestScript
Quest __temp = self as Quest
MS05QuestScript kmyQuest = __temp as MS05QuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
setObjectiveCompleted(255)
Game.GetPlayer().ModAV("SpeechcraftMod",15)
Alias_MS05Viarmo.GetActorRef().SetRelationshipRank(Game.GetPlayer(),1)
Alias_MS05Jorn.GetActorRef().SetRelationshipRank(Game.GetPlayer(),1)
Alias_MS05Giraud.GetActorRef().SetRelationshipRank(Game.GetPlayer(),1)

If kmyQuest.patronage == 7
    game.Getplayer().additem(lvlQuestReward04Wow)
Elseif kmyQuest.patronage == 6 || kmyQuest.patronage == 5
    game.Getplayer().additem(lvlQuestReward03Large)
Elseif kmyQuest.patronage == 4 || kmyQuest.patronage == 3
    game.Getplayer().additem(lvlQuestReward02Medium)
Else
    game.Getplayer().additem(lvlQuestReward01Small)
Endif


stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Game.GetPlayer().removeitem(alias_MS05GeneralTulliusCoat.GetRef())
setObjectiveCompleted (260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
MS05Rumor.setstage(20)
MS05Start.setObjectiveCompleted(10)
setObjectiveCompleted(50)
setObjectiveDisplayed (75)
Alias_MS05DeadMansRespiteMapmarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
alias_MS05Viarmo.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
setObjectiveCompleted(250)
setObjectiveCompleted(253)
setObjectiveDisplayed (255)
alias_MS05Effigy.GetRef().Enable()
MS05KingOlafsFestival.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_MS05Viarmo.GetActorRef().EvaluatePackage()
setObjectiveCompleted(100)
setObjectiveDisplayed (125)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS05CourtScene  Auto  

Quest Property MS05KingOlafsFestival  Auto  

Quest Property MS05Start  Auto  

Quest Property MS05DungeonQuest  Auto

AchievementsScript Property AchievementsQuest Auto
  

Quest Property MS05Rumor  Auto  

LeveledItem Property LvlQuestReward01Small  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  

LeveledItem Property LvlQuestReward03Large  Auto  

LeveledItem Property LvlQuestReward04Wow  Auto  
