;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_T01DegaineFavor_000D45F4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Degaine
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Degaine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chalice
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Chalice Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;failure
if (!IsObjectiveCompleted(10))
	SetObjectiveFailed(10)
endif
SetObjectiveFailed(20)
if (T01Intro.IsRunning())
	T01Intro.SetStage(20)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;success
SetObjectiveCompleted(20)
if (T01Intro.IsRunning())
	T01Intro.SetStage(20)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(T01 as T01QuestScript).DegainedEnlisted = true
if (T01Intro.IsRunning())
	T01Intro.SetStage(20)
endif
if (Game.GetPlayer().GetItemCount(T01Chalice) >= 1)
	SetStage(20)
else
	SetObjectiveDisplayed(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property T01Intro  Auto  

quest Property T01  Auto  

MiscObject Property T01Chalice  Auto  
