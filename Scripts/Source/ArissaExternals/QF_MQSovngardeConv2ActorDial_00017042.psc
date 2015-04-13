;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_MQSovngardeConv2ActorDial_00017042 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hero2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hero2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hero1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hero1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace(self + " STARTED")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace(self + " stage 200")
MQSovngardeSparringKeyword.SendStoryEvent(None, Alias_Hero1.GetActorRef(), Alias_Hero2.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Keyword Property MQSovngardeSparringKeyword  Auto  
