;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_MS01GuardAmbushQuest_000210CD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForcegreetGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ForcegreetGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;make sure guards don't aggro
Alias_Guard03.GetActorReference().RemoveFromFaction(PlayerEnemyFaction)
Alias_Guard06.GetActorReference().RemoveFromFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player surrenders
MS02.SetStage(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player makes a run for it

Alias_ForcegreetGuard.GetActorReference().SetPlayerResistingArrest()

Alias_Guard03.GetActorReference().AddtoFaction(PlayerEnemyFaction)
Alias_Guard06.GetActorReference().AddtoFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS01AmbushQuestScript
Quest __temp = self as Quest
MS01AmbushQuestScript kmyQuest = __temp as MS01AmbushQuestScript
;END AUTOCAST
;BEGIN CODE
;move guards to ambush markers
Alias_Guard03.GetActorReference().Moveto(kmyQuest.GuardMarker03)
Alias_Guard06.GetActorReference().Moveto(kmyQuest.GuardMarker06)
Alias_ForcegreetGuard.GetActorReference().Moveto(kmyquest.NeposMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;guard forcegreets player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player makes a run for it

Alias_Guard03.GetActorReference().AddtoFaction(PlayerEnemyFaction)
Alias_Guard06.GetActorReference().AddtoFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ShrineDoor  Auto  

Quest Property MS01  Auto  

Faction Property PlayerEnemyFaction  Auto  


Quest Property MS02  Auto  
