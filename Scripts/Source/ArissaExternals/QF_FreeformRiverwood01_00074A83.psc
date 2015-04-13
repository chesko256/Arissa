;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_FreeformRiverwood01_00074A83 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FaendalsLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FaendalsLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Camilla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Camilla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SvensLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SvensLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faendal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faendal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiverwoodQuestItemHoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiverwoodQuestItemHoldingChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;NPCs involved dead, fail quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Open up choice to help Faendal or not
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Player is rewarded by Faendal

Game.GetPlayer().AddItem(Gold, 25)
Alias_Faendal.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player delivers Faendal's letter and says it's from Faendal

Alias_Faendal.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Faendal.GetActorRef(), -1)

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 0)
SetObjectiveDisplayed(220, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player delivers Faendal's letter and says its from Sven

Alias_Sven.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Sven.GetActorRef(), -1)

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 0)
SetObjectiveDisplayed(210, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;open up the topic on Faendal
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has offered to help Faendal
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; open up the topic on Sven
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player turns Sven's letter over to Faendal
SetObjectiveDisplayed(110, 0)
SetObjectiveCompleted(120, 1)
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Player is rewarded by Sven

Game.GetPlayer().AddItem(Gold, 25)
Alias_Sven.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;player delivers Sven's letter and says it's from Faendal

Alias_Faendal.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Faendal.GetActorRef(), -1)

SetObjectiveCompleted(110, 1)
SetObjectiveDisplayed(120, 0)
SetObjectiveDisplayed(220, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;player delivers Sven's letter and says it's from Sven

Alias_Sven.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Sven.GetActorRef(), -1)

SetObjectiveCompleted(110, 1)
SetObjectiveDisplayed(120, 0)
SetObjectiveDisplayed(210, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Player is rewarded by Sven
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; open up choice to help Sven or not
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Player turns Faendal's letter over to Sven
SetObjectiveDisplayed(10, 0)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(110, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player has offered to help Sven
SetObjectiveDisplayed(110, 1)
SetObjectiveDisplayed(120, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorControlQuest  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property FavorCompletedFaction  Auto  

Keyword Property pFavorScene  Auto  
