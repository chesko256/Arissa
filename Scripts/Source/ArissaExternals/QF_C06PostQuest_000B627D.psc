;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_C06PostQuest_000B627D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; companions heading back to Jorrvaskr
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE C06PostQuestScript
Quest __temp = self as Quest
C06PostQuestScript kmyQuest = __temp as C06PostQuestScript
;END AUTOCAST
;BEGIN CODE
; companions hanging out in tomb
RegisterForUpdate(60)

; get Aela's radiant quests ready for post-questline
kmyQuest.trackingScript.AelaInReconMode = false
if (kmyQuest.trackingScript.AelaCurrentQuest != None)
	kmyQuest.trackingScript.AelaCurrentQuest.Stop()
	kmyQuest.trackingScript.AelaCurrentQuest = None
endif
if (kmyQuest.trackingScript.AelaNextQuest != None)
	kmyQuest.trackingScript.AelaNextQuest.Stop()
	kmyQuest.trackingScript.AelaNextQuest = None
endif
kmyQuest.trackingScript.CycleRadiantQuests()
kmyQuest.trackingScript.CycleRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C06PostQuestScript
Quest __temp = self as Quest
C06PostQuestScript kmyQuest = __temp as C06PostQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AelaShouldFG = true

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE C06PostQuestScript
Quest __temp = self as Quest
C06PostQuestScript kmyQuest = __temp as C06PostQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.trackingScript.ReOpenAllRadiantQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
