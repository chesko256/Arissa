;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformMarkarthD_00075399 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ring
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ring Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kerah
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kerah Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player delivers ring to Calcelmo
SetObjectiveCompleted(10, 1)

Alias_QuestGiver.GetActorRef().AddItem(Alias_Ring.GetRef())
Game.GetPlayer().AddItem(FavorRewardGoldSmall)

;Player is now Kerah's friend
Alias_Kerah.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
If GetStageDone(20) == 0
  FailAllObjectives()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Enable item and give it to player
Alias_Ring.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_Ring.GetRef())

SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

LeveledItem Property FavorRewardGoldSmall  Auto  
