;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_FreeformStonehillsA_00064958 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Pactur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pactur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bryling
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bryling Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
Game.GetPlayer().Additem(Gold001, (FavorRewardGoldSmall.GetValueInt()))
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

miscobject Property Gold001  Auto  

GlobalVariable Property FavorRewardGoldSmall  Auto  
