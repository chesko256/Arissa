;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunBoulderfallQST_0003A74A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bashnag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bashnag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Selveni
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Selveni Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has told Selveni the way is clear - whether or not it is.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; just start the quest and fill the aliases
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE QF_dunBoulderfallQST_0003A74A
Quest __temp = self as Quest
QF_dunBoulderfallQST_0003A74A kmyQuest = __temp as QF_dunBoulderfallQST_0003A74A
;END AUTOCAST
;BEGIN CODE
; player has freed Selveni
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE QF_dunBoulderfallQST_0003A74A
Quest __temp = self as Quest
QF_dunBoulderfallQST_0003A74A kmyQuest = __temp as QF_dunBoulderfallQST_0003A74A
;END AUTOCAST
;BEGIN CODE
; selvani dies befoire escaping
myQuest.SetObjectiveFailed(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE QF_dunBoulderfallQST_0003A74A
Quest __temp = self as Quest
QF_dunBoulderfallQST_0003A74A kmyQuest = __temp as QF_dunBoulderfallQST_0003A74A
;END AUTOCAST
;BEGIN CODE
; player has discovered Selveni but not freed her
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE QF_dunBoulderfallQST_0003A74A
Quest __temp = self as Quest
QF_dunBoulderfallQST_0003A74A kmyQuest = __temp as QF_dunBoulderfallQST_0003A74A
;END AUTOCAST
;BEGIN CODE
; Selvani has escaped safely.
myQuest.setObjectiveCompleted(1)
AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property myQuest  Auto  
AchievementsScript Property AchievementsQuest Auto
