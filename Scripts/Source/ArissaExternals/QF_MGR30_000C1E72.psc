;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_MGR30_000C1E72 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Anomaly_Marker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Anomaly_Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolfdir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Tolfdir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Anomaly
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Anomaly Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20)
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).RegisterForSingleUpdateGameTime(72)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().Additem(LvlQuestReward03Large,1)
; Debug.Trace("MGR30 finished")
(DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).RegisterForSingleUpdateGameTime(72)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LvlQuestReward03Large  Auto  

Quest Property DialogueWinterholdCollege  Auto  
