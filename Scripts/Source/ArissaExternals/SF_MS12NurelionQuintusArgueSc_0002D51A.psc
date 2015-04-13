;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_MS12NurelionQuintusArgueSc_0002D51A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(GetOwningQuest() as MS12QuestScript).QuintusLookForTonic = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Nurelion.GetActorRef().PlayIdle(Cough)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Nurelion.GetRef().MoveTo(NurelionSpot)
Quintus.GetRef().MoveTo(QuintusSpot)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Nurelion.GetActorRef().RemoveFromFaction(WINoGreeting)
Quintus.GetActorRef().RemoveFromFaction(WINoGreeting)
(GetOwningQuest() as MS12QuestScript).QuintusLookForTonic = True
Quintus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property NurelionSpot  Auto  

ObjectReference Property QuintusSpot  Auto  

ReferenceAlias Property Nurelion  Auto  

ReferenceAlias Property Quintus  Auto  

Faction Property WINoGreeting  Auto  

Idle Property Cough  Auto  
