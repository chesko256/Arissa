;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_TGFences_000D8828 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGFGulumEiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFGulumEiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFEnthirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFEnthirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFMallusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFMallusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFAtahbaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFAtahbaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFMajhadAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFMajhadAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFZaynabiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFZaynabiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFNiranyeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFNiranyeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFEndonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFEndonAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TGFencesQuestScript
Quest __temp = self as Quest
TGFencesQuestScript kmyQuest = __temp as TGFencesQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Endon as a Fence
pTGFQS.EndonSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TGFencesQuestScript
Quest __temp = self as Quest
TGFencesQuestScript kmyQuest = __temp as TGFencesQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Mallus as a Fence
pTGFQS.MallusSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGFencesQuestScript
Quest __temp = self as Quest
TGFencesQuestScript kmyQuest = __temp as TGFencesQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Niranye as a Fence
pTGFQS.NiranyeSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGFencesQuestScript
Quest __temp = self as Quest
TGFencesQuestScript kmyQuest = __temp as TGFencesQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Gulum-Ei as a Fence
pTGFQS.GulumSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Activate all the Khajiit Caravan Fences (Atahba, Majhad, Zaynabi)
pTGFQS.KhajiitSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TGFencesQuestScript
Quest __temp = self as Quest
TGFencesQuestScript kmyQuest = __temp as TGFencesQuestScript
;END AUTOCAST
;BEGIN CODE
;Activate Enthir as a Fence
pTGFQS.EnthirSetup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGFencesQuestScript Property pTGFQS  Auto  
