;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_WERJ13_000F5BC1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PitWolf03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PitWolf03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PitWolf02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PitWolf02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadNPC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PitWolf01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PitWolf01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CragslaneMM
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CragslaneMM Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_PitWolf01.GetReference().DeleteWhenAble()
Alias_PitWolf02.GetReference().DeleteWhenAble()
Alias_PitWolf03.GetReference().DeleteWhenAble()
Alias_DeadNPC.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + "stage 0")

Alias_DeadNPC.GetReference().addItem(Alias_Note.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_CragslaneMM.GetReference().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold001  Auto  
