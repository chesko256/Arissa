;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformOldHroldanB_0006819A Extends Quest Hidden

;BEGIN ALIAS PROPERTY TiberSeptimBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TiberSeptimBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eydis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eydis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HjaltiSword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HjaltiSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player knows where the sword is
Alias_MapMarker.GetRef().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has talked to the ghost
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE FreeformOldHroldanBQuestScript
Quest __temp = self as Quest
FreeformOldHroldanBQuestScript kmyQuest = __temp as FreeformOldHroldanBQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
;Ghosts vanishes
Alias_Ghost.GetActorRef().AddItem(Alias_HjaltiSword.GetReference())
Alias_Ghost.GetActorRef().Disable()
Alias_Eydis.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE FreeformOldHroldanBQuestScript
Quest __temp = self as Quest
FreeformOldHroldanBQuestScript kmyQuest = __temp as FreeformOldHroldanBQuestScript
;END AUTOCAST
;BEGIN CODE
;Player sleeps in Talos's bed, trigger the haunting
EydisScene.Start()
Alias_Ghost.GetActorReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has activated the bed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property EydisScene  Auto  

GlobalVariable Property GameHour  Auto  

CWAlliesScript Property CWAllies  Auto  
