;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_FreeformMorthalB_00021896 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gorm
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gorm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aldis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aldis Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Aldis is dead. kill quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player has delivered letter
Alias_Gorm.GetActorReference().SetRelationshipRank(Game.GetPlayer(),1)
Game.GetPlayer().AddItem(Gold001, 20)
Game.GetPlayer().RemoveItem(Alias_Note.GetReference(),1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has been given letter
Game.GetPlayer().AddItem(Alias_Note.GetReference(),1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

miscobject Property Gold001  Auto  
