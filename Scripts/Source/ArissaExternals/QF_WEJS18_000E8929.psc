;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_WEJS18_000E8929 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Fire2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fire2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurntCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurntCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dog
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dog Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Smoke2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Smoke2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurntCorpse2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurntCorpse2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fire3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fire3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Smoke
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Smoke Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Smoke3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Smoke3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurntCorpse3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurntCorpse3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Fire.GetReference().DeleteWhenAble()
Alias_Smoke.GetReference().DeleteWhenAble()
Alias_Fire2.GetReference().DeleteWhenAble()
Alias_Smoke2.GetReference().DeleteWhenAble()
Alias_Fire3.GetReference().DeleteWhenAble()
Alias_Smoke3.GetReference().DeleteWhenAble()
Alias_Cart.GetReference().DeleteWhenAble()
Alias_BurntCorpse.GetReference().DeleteWhenAble()
Alias_BurntCorpse2.GetReference().DeleteWhenAble()
Alias_BurntCorpse3.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

