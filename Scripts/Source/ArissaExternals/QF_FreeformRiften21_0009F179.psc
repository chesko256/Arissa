;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_FreeformRiften21_0009F179 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften21Journal03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21Journal03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften21Journal01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21Journal01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften21Journal04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21Journal04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften21MarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21MarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften21Vekel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21Vekel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften21Journal02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften21Journal02Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Quest Completed - Reward
pThaneCount.Value += 1
Game.GetPlayer().AddItem(pReward,1)
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;All 4 Journals recovered, return to Vekel
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player seeks out Yngvild
SetObjectiveDisplayed(10,1)
pMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player Enters Yngvild - Find Arondil's Journals (4 Total)
UpdateCurrentInstanceGlobal(pJournalsGlobal)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup (Vekel)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto

GlobalVariable Property pJournalsGlobal  Auto  

ObjectReference Property pMapMarker  Auto  

LeveledItem Property pReward  Auto  
