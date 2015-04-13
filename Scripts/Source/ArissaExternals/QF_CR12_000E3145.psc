;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_CR12_000E3145 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TotemMarker3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TotemMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Totem
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Totem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonTreasureMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DungeonTreasureMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TotemMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TotemMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestgiverEssentialized
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestgiverEssentialized Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TotemMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TotemMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player accepted quest. 
SetObjectiveDisplayed(10, 1)

Alias_Questgiver.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest complete.
SetObjectiveCompleted(20, 1)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR12QuestScript
Quest __temp = self as Quest
CR12QuestScript kmyQuest = __temp as CR12QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CR12QuestScript
Quest __temp = self as Quest
CR12QuestScript kmyQuest = __temp as CR12QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CR12QuestScript
Quest __temp = self as Quest
CR12QuestScript kmyQuest = __temp as CR12QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

int tf= (kmyQuest.ParentQuest as CompanionsHousekeepingScript).TotemsFound
if (tf == 0)
	Alias_TotemMarker1.GetRef().Enable()
elseif (tf == 1)
	Alias_TotemMarker2.GetRef().Enable()
else
	Alias_TotemMarker3.GetRef().Enable()
endif

kmyQuest.Finished()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
