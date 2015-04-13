;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformSalviusFarmA_000931BF Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Leonitus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Leonitus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)

Alias_Leonitus.GetActorRef().AddItem(Alias_Letter.GetRef())
Game.GetPlayer().AddItem(Gold, 25)

;Player is now Rogatus's friend
Alias_QuestGiver.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Rogatus asks the player for help
SetObjectiveDisplayed(10, 1)

Alias_Letter.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_Letter.GetRef())

;add map marker
OldHroldanMapMarker.AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;NPCs dead, fail quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

ObjectReference Property OldHroldanMapMarker  Auto  
