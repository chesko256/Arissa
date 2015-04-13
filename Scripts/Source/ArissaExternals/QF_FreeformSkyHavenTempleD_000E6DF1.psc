;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FreeformSkyHavenTempleD_000E6DF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player turns in the scales and bone
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(DragonBone, 1)
Game.GetPlayer().RemoveItem(DragonScales, 1)
Game.GetPlayer().AddItem(BladesPotion, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Esbern will accept dragon bones and scales
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property BladesPotion  Auto  

MiscObject Property DragonBone  Auto  

MiscObject Property DragonScales  Auto  
