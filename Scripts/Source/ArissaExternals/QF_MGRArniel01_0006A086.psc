;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MGRArniel01_0006A086 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArnielGane
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArnielGane Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MGRArniel02.Start()
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(DweCog, 10)
Game.GetPlayer().AddItem(FavorRewardGoldSmall, 1 )
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MGRArniel02  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

miscobject Property DweCog  Auto  

LeveledItem Property FavorRewardGoldSmall  Auto  
