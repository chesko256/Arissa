;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_T02PostQuest_000CC794 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Fastred
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fastred Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bassianus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bassianus Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE T02PostQuestScript
Quest __temp = self as Quest
T02PostQuestScript kmyQuest = __temp as T02PostQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Bassianus.GetRef().MoveTo(BunkhouseMarker)
Alias_Bassianus.GetActorRef().RemoveFromFaction(TownIvarsteadFaction)
Alias_Bassianus.GetActorRef().AddToFaction(TownRiftenFaction)
if (kmyQuest.FastredMoveToRiften)
	Alias_Fastred.GetRef().MoveTo(BunkhouseMarker)
	Alias_Fastred.GetActorRef().RemoveFromFaction(TownIvarsteadFaction)
	Alias_Fastred.GetActorRef().AddToFaction(TownRiftenFaction)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE T02PostQuestScript
Quest __temp = self as Quest
T02PostQuestScript kmyQuest = __temp as T02PostQuestScript
;END AUTOCAST
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BunkhouseMarker  Auto  

Faction Property TownRiftenFaction  Auto  
Faction Property TownIvarsteadFaction  Auto  
