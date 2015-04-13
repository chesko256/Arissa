;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_SolitudeFreeform07_000E77BA Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlacedHorn
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PlacedHorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HornActivator
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HornActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_QuestGiver.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)

SetObjectiveCompleted(20, 1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Game.GetPlayer().Removeitem(alias_item.GetRef())
alias_HornActivator.GetRef().Disable()
Alias_PlacedHorn.GetRef().Enable()
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Enable item and give it to player
alias_HornActivator.GetRef().Enable()
Game.GetPlayer().Additem(alias_item.GetRef())
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
If GetStageDone(30) == 0
  FailAllObjectives()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorControlQuest  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

GlobalVariable Property FavorCost  Auto  

Faction Property FavorCompletedFaction  Auto  

Faction Property Favor011QuestGiverFaction  Auto  
