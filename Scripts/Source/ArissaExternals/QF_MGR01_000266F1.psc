;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_MGR01_000266F1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ItemMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGR01Item
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MGR01Item Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(20,1)
Game.GetPlayer().RemoveItem((Alias_MGR01Item.GetReference()),1)
MGRShellScript MGR = pMGRShell as MGRShellScript
MGR.MGRTolfdirDay=GameDay.GetValue() as int
Game.GetPlayer().AddItem(Gold001, 30)
Game.GetPlayer().AddItem(LItemSoulGemFullTown,1)
; Debug.Trace("MGR01 Completed")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property pMGRShell  Auto  


GlobalVariable Property FavorRewardSmall  Auto  

GlobalVariable Property GameDay  Auto  

LeveledItem Property LItemSoulGemFullTown  Auto  

miscobject Property Gold001  Auto  
