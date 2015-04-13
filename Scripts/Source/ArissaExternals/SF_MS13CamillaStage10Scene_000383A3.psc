;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_MS13CamillaStage10Scene_000383A3 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(MS13 as MS13QuestScript).CamillaEscort = 1
MS13CamillaEscortPlayerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MS13QuestScript myQuest
myQuest = MS13 as MS13QuestScript
myQuest.SceneTriggers = 1

BleakFallsMapMarker.AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS13  Auto  

ReferenceAlias Property Camilla  Auto  

ObjectReference Property BleakFallsMapMarker  Auto  

Scene Property Ms13CamillaEscortPlayerScene  Auto  
