;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MGR21_000E0E04 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BookContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_BookLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MGR21QuestScript
Quest __temp = self as Quest
MGR21QuestScript kmyQuest = __temp as MGR21QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(Alias_Book.GetReference(), 1)
kmyQuest.FirstTime=True
Stop()
MGR22.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_BookContainer.GetReference().AddItem(Alias_Book.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property MGR22  Auto  
