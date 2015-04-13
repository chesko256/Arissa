;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformRiften17_0005B2DE Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften17HoldingAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften17HoldingAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften17FilnjarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften17FilnjarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften17HafjorgAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften17HafjorgAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften17OreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften17OreAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Ore picked up, return it to Hafjorg
Game.GetPlayer().AddItem(Alias_FFRiften17OreAlias.GetRef())
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player is assigned the quest to pick up ore from Filnjar
SetObjectiveDisplayed(10,1)
pShorsStoneMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().RemoveItem(Alias_FFRiften17OreAlias.GetRef())
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften17FilnjarAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

ObjectReference Property pShorsStoneMapMarker  Auto  
