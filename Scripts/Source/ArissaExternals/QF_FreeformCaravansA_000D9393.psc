;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformCaravansA_000D9393 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
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
SetObjectiveCompleted(15, 1)
Alias_QuestGiver.GetActorReference().AddItem(Alias_QuestItem.GetReference())
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Alias_MapMarker.GetRef().AddtoMap()

;enable quest item
Alias_QuestItem.GetRef().Enable()
Alias_BossContainer.GetRef().AddItem(Alias_QuestItem.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player has the item
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

GlobalVariable Property FavorCost  Auto  

Faction Property FavorCompletedFaction  Auto  

Faction Property Favor204QuestGiverFaction  Auto  
