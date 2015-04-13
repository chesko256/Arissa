;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_MGRArniel02_0006A08D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arniel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arniel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gem
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enthir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Enthir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DungeonBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Staff
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Staff Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MGRArniel02Script
Quest __temp = self as Quest
MGRArniel02Script kmyQuest = __temp as MGRArniel02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.QuestTrigger=GameDaysPassed.GetValue() + 2
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;test
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40,1)
Alias_Arniel.GetActorReference().ModFavorPoints(FavorRewardSmall.GetValueInt())
Game.GetPlayer().RemoveItem(Alias_Gem.GetReference(), 1)
if MG08.GetStage() == 200
MGRArniel03.Start()
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
Game.GetPlayer().AddItem(Alias_Gem.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed  Auto  


GlobalVariable Property FavorRewardSmall  Auto  

Quest Property MGRArniel03  Auto  

Quest Property MG08  Auto  
