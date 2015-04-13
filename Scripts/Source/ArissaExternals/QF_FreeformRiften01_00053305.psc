;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_FreeformRiften01_00053305 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften01MavenJarlAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften01MavenJarlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften01LailaJarlAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften01LailaJarlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften01CragslaneMarkerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften01CragslaneMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player reports to Jarl
SetObjectiveCompleted (30,1)
SetObjectiveDisplayed (40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE FFRiften01QuestScript
Quest __temp = self as Quest
FFRiften01QuestScript kmyQuest = __temp as FFRiften01QuestScript
;END AUTOCAST
;BEGIN CODE
;Mini-Questline Complete!
Game.GetPlayer().AddItem(pReward,1)
pThaneQLDone.Value = 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE FFRiften01QuestScript
Quest __temp = self as Quest
FFRiften01QuestScript kmyQuest = __temp as FFRiften01QuestScript
;END AUTOCAST
;BEGIN CODE
;Skooma source note from Freeform Riften 20 Points to Jarl
SetObjectiveDisplayed (10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player wipes out Skooma operation
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Cragslane Cavern is pointed to
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
pCragslane.Reset()
pdunCragslaneEnableMarker01.Enable()
pMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMapMarker  Auto  

LeveledItem Property pReward  Auto  

GlobalVariable Property pThaneQLDone  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

Cell Property pCragslane  Auto  

ObjectReference Property pdunCragslaneEnableMarker01  Auto  
