;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformMarkarthE_000753A1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Statue
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Statue Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForswornCamp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ForswornCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;update objectives if the player talks to Lisbet

If GetStageDone(10) == 1
  SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player delivers the statue to Lisbet
SetObjectiveCompleted(15, 1)

Alias_QuestGiver.GetActorRef().AddItem(Alias_Statue.GetRef())
Game.GetPlayer().AddItem(FavorRewardGoldLarge)

;Player is now Lisbet's confidant
Alias_QuestGiver.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Lisbet asks the player for help
SetObjectiveDisplayed(10, 1)

Alias_MapMarker.GetRef().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
