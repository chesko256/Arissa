;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_WERJ02_000B8169 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
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

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
actor Thief = alias_Thief.getReference() as Actor

Game.GetPlayer().RemoveItem(Gold001, 200)
Thief.additem(Gold001,200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
actor Thief = alias_Thief.getReference() as Actor
Thief.StartCombat(Game.GetPlayer())
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
Alias_Thief.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
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

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
game.getPlayer().addItem(Gold001, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
game.getPlayer().addItem(Lockpick, 5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

MiscObject Property Lockpick  Auto  
