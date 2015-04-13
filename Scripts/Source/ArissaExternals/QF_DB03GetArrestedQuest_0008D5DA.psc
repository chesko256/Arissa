;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DB03GetArrestedQuest_0008D5DA Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB03GetArrestedQuestScript
Quest __temp = self as Quest
DB03GetArrestedQuestScript kmyQuest = __temp as DB03GetArrestedQuestScript
;END AUTOCAST
;BEGIN CODE
;debug.messagebox("DB03GetArrestedQuest is working")
; ;debug.trace("DB03GetArrestedQuest is working")
kmyQuest.DB03.SetStage (30)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
