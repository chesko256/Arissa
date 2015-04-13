;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_WIChangeLocation04_0006F211 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Student
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Student Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE WIChangeLocation04Script
Quest __temp = self as Quest
WIChangeLocation04Script kmyQuest = __temp as WIChangeLocation04Script
;END AUTOCAST
;BEGIN CODE
Alias_Student.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE WIChangeLocation04Script
Quest __temp = self as Quest
WIChangeLocation04Script kmyQuest = __temp as WIChangeLocation04Script
;END AUTOCAST
;BEGIN CODE
if GetStageDone(110) == false
   SetObjectiveFailed(100)
endif

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation04Script
Quest __temp = self as Quest
WIChangeLocation04Script kmyQuest = __temp as WIChangeLocation04Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIChangeLocation04 started in location:" + Alias_NewLocation.GetLocation())
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE WIChangeLocation04Script
Quest __temp = self as Quest
WIChangeLocation04Script kmyQuest = __temp as WIChangeLocation04Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
kmyquest.WIChangeLocation04Scene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
