;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_FreeformFrostRiver_000681D4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Borvir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Borvir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rundi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rundi Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE FreeformFrostRiverQuestScript
Quest __temp = self as Quest
FreeformFrostRiverQuestScript kmyQuest = __temp as FreeformFrostRiverQuestScript
;END AUTOCAST
;BEGIN CODE
;deilvery has been made
FreeformFrostRiverQuestScript QuestScript = kmyquest as FreeformFrostRiverQuestScript
QuestScript.DestinationVar = 0
Reset.Value = GameDaysPassed.Value + 2
Game.GetPlayer().AddItem(Gold, 50)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has been given delivery
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Reset  Auto  

GlobalVariable Property GameDaysPassed  Auto  

MiscObject Property Gold  Auto  
