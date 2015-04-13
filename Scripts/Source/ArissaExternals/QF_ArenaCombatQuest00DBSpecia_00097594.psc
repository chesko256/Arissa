;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_ArenaCombatQuest00DBSpecia_00097594 Extends Quest Hidden

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
;BEGIN AUTOCAST TYPE ArenaTransitionCombatQuest
Quest __temp = self as Quest
ArenaTransitionCombatQuest kmyQuest = __temp as ArenaTransitionCombatQuest
;END AUTOCAST
;BEGIN CODE
if (Alias_Combatant1.GetReference().GetParentCell() == WindhelmBloodworks)
	;(kmyQuest.ParentQuest as ArenaScript).DBFightWentAwry = True
	Huki.GetActorReference().EvaluatePackage()
endif

kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE ArenaTransitionCombatQuest
Quest __temp = self as Quest
ArenaTransitionCombatQuest kmyQuest = __temp as ArenaTransitionCombatQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetupTransition(false)
Alias_Combatant1.GetActorRef().RemoveFromFaction(ArenaSelfLoathingFaction)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property ArenaSelfLoathingFaction  Auto  

Cell Property WindhelmBloodworks  Auto  

ReferenceAlias Property Huki  Auto  
