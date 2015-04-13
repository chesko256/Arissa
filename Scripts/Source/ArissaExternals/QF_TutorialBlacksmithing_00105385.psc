;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_TutorialBlacksmithing_00105385 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AlvorWheelMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlvorWheelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneTanningMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdrianneTanningMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneWorkbench
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdrianneWorkbench Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneForgeMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdrianneForgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvorForgeMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlvorForgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodTanningMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LodTanningMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvorTanning
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlvorTanning Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lod
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvorWorkbench
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlvorWorkbench Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodWheelMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LodWheelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneWheelMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdrianneWheelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Adrianne
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Adrianne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alvor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Alvor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodForgeMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LodForgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodWorkbench
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LodWorkbench Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Tutorial complete
SetObjectiveCompleted(100, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has tanned the leather
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player is told to tan some hide
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

Game.GetPlayer().AddItem(DeerHide, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player kills the questgiver
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player is told to sharpen things up
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
Game.GetPlayer().AddItem(IronIngot, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has sharpened dagger
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player has brought the leather
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)

;give player components
Game.GetPlayer().Additem(Leather, 2)
Game.GetPlayer().AddItem(LeatherStrips, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has tempered the helmet
SetObjectiveCompleted(90, 1)
SetObjectiveDisplayed(100, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Objective to forge the dagger (Lod)
SetObjectiveDisplayed(10, 1)

;give player needed items
Game.GetPlayer().AddItem(IronIngot, 2)
Game.GetPlayer().AddItem(Leatherstraps, 2)

;make sure Lod isn't using the forge
Alias_Lod.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has made an iron dagger
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Objective to forge the dagger (Adrianne)
SetObjectiveDisplayed(10, 1)

;give player needed items
Game.GetPlayer().AddItem(IronIngot, 2)
Game.GetPlayer().AddItem(Leatherstraps, 2)

;make sure Adrianne isn't using the forge
Alias_Adrianne.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Objective to forge the dagger (Alvor)
SetObjectiveDisplayed(10, 1)

;give player needed items
Game.GetPlayer().AddItem(IronIngot, 2)
Game.GetPlayer().AddItem(Leatherstraps, 2)

;make sure Alvor isn't using the forge
Alias_Alvor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player has made the helmet
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player is told to improve the helmet
SetObjectiveCompleted(80, 1)
SetObjectiveDisplayed(90, 1)

;give player components
Game.GetPlayer().Additem(Leather, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property IronIngot  Auto  

MiscObject Property LeatherStraps  Auto  

MiscObject Property DeerHide  Auto  

MiscObject Property LeatherStrips  Auto  

MiscObject Property Leather  Auto  

Weapon Property IronDagger  Auto  

Armor Property ArmorHideHelmet  Auto  

MiscObject Property Gold001  Auto  
