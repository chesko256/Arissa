;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_TutorialAlchemy_0010557C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arcadia
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arcadia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Zaria
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Zaria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrgnarMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OrgnarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZariaMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ZariaMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArcadiaMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; make sure Zaria doesn't use the alchemy workbench
Alias_Zaria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; potion crafted
Alias_Player.UnRegisterForUpdateGameTime()
SetObjectiveCompleted(10, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player has left the area
Alias_Player.UnRegisterForUpdateGameTime()
SetObjectiveDisplayed(10, abdisplayed = false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player is told to make a healing potion
SetObjectiveDisplayed(10, 1)

;Game.GetPlayer().AddItem(DragonflyBlue, 1)
;Game.GetPlayer().AddItem(Mushroom06, 1)

;check to see if the player leaves
Alias_Player.RegisterForUpdateGameTime(0.2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; make sure Zaria doesn't use the alchemy workbench
Alias_Arcadia.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property Mushroom06  Auto  

Ingredient Property DragonflyBlue  Auto  
