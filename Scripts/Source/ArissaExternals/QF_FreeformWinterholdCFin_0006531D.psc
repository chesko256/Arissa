;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_FreeformWinterholdCFin_0006531D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ranmir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ranmir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Birna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Birna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dagur Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE FreeformWinterholdCFinQuestScript
Quest __temp = self as Quest
FreeformWinterholdCFinQuestScript kmyQuest = __temp as FreeformWinterholdCFinQuestScript
;END AUTOCAST
;BEGIN CODE
;player has returned to Winterhold after completing FreeformWinterholdC
Alias_Ranmir.GetReference().Disable()
kMyQuest.RanmirGone=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
