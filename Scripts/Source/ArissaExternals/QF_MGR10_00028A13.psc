;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_MGR10_00028A13 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Client
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Client Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnchatingItem
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EnchatingItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClientLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_ClientLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingContainer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HoldingContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
MGRShellScript MGR = MGRShell as MGRShellScript
MGR.StartSergiusQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().AddItem(Alias_EnchatingItem.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Client died before pick-up
FailAllObjectives()
MGRShellScript MGR = MGRShell as MGRShellScript
MGR.StartSergiusQuest()
MGR.pMGR10Done = 1 
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(20,1)
Game.GetPlayer().Additem(LvlQuestReward01Small,1)
Game.GetPlayer().RemoveItem(Alias_EnchatingItem.GetReference(), 1)
MGRShellScript MGR = MGRShell as MGRShellScript
MGR.StartSergiusQuest()
MGR.pMGR10Done = 1 
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property MGRShell  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

LeveledItem Property LvlQuestReward01Small  Auto  
