;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_MGR02_000266F2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FocusPoint5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FocusPoint5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FocusPoint1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FocusPoint1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FocusPoint4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FocusPoint4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gloves
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gloves Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FocusPoint2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FocusPoint2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FocusPoint3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FocusPoint3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE MGR02QuestScript
Quest __temp = self as Quest
MGR02QuestScript kmyQuest = __temp as MGR02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
Game.GetPlayer().Removeitem(Alias_Gloves.GetReference(),1)
Alias_Questgiver.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardSmall.GetValueInt())
MGRShellScript MGR = pMGRShell as MGRShellScript
MGR.StartDrevisQuest()
MGR.pMGR02Done = 1
kmyQuest.Point1Done = 0
kmyQuest.Point2Done = 0
kmyQuest.Point3Done = 0
kmyQuest.Point4Done = 0
kmyQuest.Point5Done = 0
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_FocusPoint1.GetReference().Enable()
Alias_FocusPoint1.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",1.0)
Alias_FocusPoint2.GetReference().Enable()
Alias_FocusPoint2.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",1.0)
Alias_FocusPoint3.GetReference().Enable()
Alias_FocusPoint3.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",1.0)
Game.GetPlayer().additem(Alias_Gloves.GetReference(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;quest has been failed because questgiver is dead
FailAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property pMGRShell  Auto  

armor Property pMGR02Gloves  Auto  
