;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_ArenaCombatQuest00JailFigh_000967DD Extends Quest Hidden

;BEGIN ALIAS PROPERTY CombatantSpot1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CombatantSpot1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PitLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_PitLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Combatant1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Combatant1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE ArenaCombatQuest
Quest __temp = self as Quest
ArenaCombatQuest kmyQuest = __temp as ArenaCombatQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE ArenaCombatQuest
Quest __temp = self as Quest
ArenaCombatQuest kmyQuest = __temp as ArenaCombatQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

