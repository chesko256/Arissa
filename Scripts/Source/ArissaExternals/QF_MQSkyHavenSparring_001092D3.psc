;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_MQSkyHavenSparring_001092D3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hero1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hero1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hero2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hero2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; second info
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; debug.trace(self + " DONE")
setstage(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Alias_Hero1.GetActorRef().RestoreActorValue("health", 100)
Alias_Hero2.GetActorRef().RestoreActorValue("health", 100)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; first info
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MQSovngardeConv2Script
Quest __temp = self as Quest
MQSovngardeConv2Script kmyQuest = __temp as MQSovngardeConv2Script
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 200")
kmyquest.stopWICrowd()
Alias_Hero1.GetActorRef().StopCombatAlarm()
Alias_Hero2.GetActorRef().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace(self + " STARTED")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQSovngardeConv2Script
Quest __temp = self as Quest
MQSovngardeConv2Script kmyQuest = __temp as MQSovngardeConv2Script
;END AUTOCAST
;BEGIN CODE
; start WICrowd 
;WICrowdStart.SendStoryEvent(None, Alias_Hero1.GetRef(), Alias_Hero2.GetRef())
;WI.startWICrowd(Alias_Hero1.GetRef(), Alias_Hero2.GetRef())
kmyquest.startWICrowd(Alias_Hero1.GetRef(), Alias_Hero2.GetRef())
Alias_Hero1.GetActorRef().StartCombat(Alias_Hero2.GetActorRef())
Alias_Hero2.GetActorRef().StartCombat(Alias_Hero1.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; hero 1 loses
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; hero 2 loses
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property WICrowdStart  Auto  

Quest Property WICrowd  Auto  

WIFunctionsScript  Property WI  Auto  
