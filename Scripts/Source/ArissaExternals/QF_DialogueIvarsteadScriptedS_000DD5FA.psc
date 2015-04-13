;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_DialogueIvarsteadScriptedS_000DD5FA Extends Quest Hidden

;BEGIN ALIAS PROPERTY IvarsteadSSKlimmekAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IvarsteadSSKlimmekAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IvarsteadSSGwilinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IvarsteadSSGwilinAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RDSQuestScript
Quest __temp = self as Quest
RDSQuestScript kmyQuest = __temp as RDSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.pRDSGlobal.Value = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE RDSQuestScript
Quest __temp = self as Quest
RDSQuestScript kmyQuest = __temp as RDSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.pGo = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMarker  Auto  
