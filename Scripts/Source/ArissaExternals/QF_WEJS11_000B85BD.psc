;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_WEJS11_000B85BD Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sigar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sigar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Corpse
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Corpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Sigar.GetReference().DeleteWhenAble()
Alias_Corpse.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;(Alias_Sigar.GetActorReference()).startCombat(game.getplayer())
(Alias_Sigar.GetActorReference()).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


