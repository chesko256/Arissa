;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_WEDL03_000B8143 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Husband
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Husband Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wife
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wife Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Solitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Solitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bodyguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bodyguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

Alias_Husband.GetReference().DeleteWhenAble()
Alias_Wife.GetReference().DeleteWhenAble()
Alias_BodyGuard.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;player has chosen attack dialog option or has attacked them
WEDL03Faction.setEnemy(PlayerFaction)
(alias_Bodyguard.getReference() as actor).setAV("Aggression",1)
(alias_Bodyguard.getReference() as actor).startCombat(game.getPlayer())
(alias_Bodyguard.getReference() as actor).evaluatePackage()
(alias_Husband.getReference() as actor).evaluatePackage()
(alias_Wife.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;bodyguard killed, Couple should run for their lives
Alias_Husband.GetActorReference().evaluatePackage()
Alias_Wife.GetActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property WEDL03Faction  Auto  

Faction Property PlayerFaction  Auto  
