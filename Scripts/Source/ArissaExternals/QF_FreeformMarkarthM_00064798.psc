;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformMarkarthM_00064798 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ogmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ogmund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ondolemar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ondolemar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player has the amulet
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player brings the amulet to Ogmund
SetObjectiveFailed(15, 1)
Alias_Ondolemar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Ogmund.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Actors are dead, fail quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;Enable quest item and move it to the container
Alias_QuestItem.GetRef().Enable()
Alias_QuestContainer.GetRef().AddItem(Alias_QuestItem.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player brings the amulet to Ondolemar
SetObjectiveCompleted(15, 1)
Alias_Ondolemar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Ogmund.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
