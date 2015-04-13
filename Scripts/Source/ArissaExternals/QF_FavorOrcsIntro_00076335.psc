;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FavorOrcsIntro_00076335 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chief
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Chief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
Alias_QuestGiver.GetActorRef().AddItem(Alias_QuestItem.GetRef())
Game.GetPlayer().AddToFaction(OrcFriendFaction)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Play kills people
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Alias_MapMarker.GetRef().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Guard has forcegreeted again

;open gate
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property OrcFriendFaction  Auto  
