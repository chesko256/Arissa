;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_MGRShell_00028A55 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MGRShellScript
Quest __temp = self as Quest
MGRShellScript kmyQuest = __temp as MGRShellScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartTolfdirQuest()
kmyQuest.StartDrevisQuest()
kmyQuest.StartSergiusQuest()
kmyQuest.StartUragQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
