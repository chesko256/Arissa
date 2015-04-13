;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformDragonBridge01_000555DD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Olda
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Olda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horgeir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Horgeir Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player gives the mead to Olda
Alias_Olda.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Horgeir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
SetObjectiveCompleted(20, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has the item
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
UnRegisterForUpdate()
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Freeform started
SetObjectiveDisplayed(10, 1)

;Enable Quest Item
Alias_QuestItem.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player gives the mead to Horgeir
Alias_Horgeir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Olda.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
SetObjectiveFailed(20, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
