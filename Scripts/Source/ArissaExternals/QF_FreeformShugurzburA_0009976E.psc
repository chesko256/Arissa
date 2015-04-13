;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_FreeformShugurzburA_0009976E Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lash
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lash Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)

Alias_Lash.GetActorRef().AddItem(Alias_Sword.GetRef())
Game.GetPlayer().AddItem(FavorRewardGoldSmall)

;Player is now Sharn's friend
Alias_QuestGiver.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Sharn asks the player for help
SetObjectiveDisplayed(10, 1)

Game.GetPlayer().AddItem(Alias_Sword.GetRef())

;Add map marker to Karthwasten
KarthwastenMapMarker.AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; NPCs dead
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

ObjectReference Property KarthwastenMapMarker  Auto  

LeveledItem Property FavorRewardGoldSmall  Auto  
