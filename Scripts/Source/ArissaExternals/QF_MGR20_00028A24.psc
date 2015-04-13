;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_MGR20_00028A24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BookContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BookLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
MGR20Book = Alias_Book.GetReference().GetBaseObject() as book
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Game.GetPlayer().Additem(pMGR20Note.GetReference(),1)
Alias_LocationMapMarker.GetReference().AddtoMap()
Alias_BookContainer.GetReference().AddItem(Alias_Book.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20,1)

Game.GetPlayer().Removeitem(pMGR20Note.GetReference(),1)
Game.GetPlayer().Removeitem(Alias_Book.GetReference(),1)
Game.GetPlayer().AddItem(Gold001, ((Alias_Book.GetReference().GetGoldValue() * 1.2) as int))
(MGRShell as MGRShellScript).StartUragQuest()
(MGRShell as MGRShellScript).pMGR20Done = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MGRShell  Auto  

Book Property MGR20Book  Auto  

ReferenceAlias Property pMGR20Note  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  

miscobject Property Gold001  Auto  
