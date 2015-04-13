;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DA02DeadBody_000B48FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeadActor
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DeadActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Actor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA02DeadBodyScript
Quest __temp = self as Quest
DA02DeadBodyScript kmyQuest = __temp as DA02DeadBodyScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("DA02DeadBody Stage 0, calling sound alarm. Body:" + Alias_DeadActor.GetReference() + ", Discovered by:" + Alias_Actor.GetReference())
kmyquest.da02.soundAlarm(Alias_DeadActor.GetReference())

; debug.trace("DA02DeadBody Stage 0, calling stop on self")
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
