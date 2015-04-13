;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_WERJ04_000B94AB Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
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

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kid01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kid01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kid02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kid02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DweBridgeMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DweBridgeMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
game.getPlayer().removeItem(Gold001, 1)
alias_Kid01.GetReference().addItem(Gold001,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Kid01.GetReference().DeleteWhenAble()
Alias_Kid02.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_DweBridgeMapMarker.GetReference().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold001  Auto  
