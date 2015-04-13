;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__00063B54 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; get rid of cup
akSpeaker.PlayIdle(OffsetCarryMQ201DrinkR)
akSpeaker.PlayIdle(OffsetStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; lift cup
akSpeaker.PlayIdle(IdleMQ201ToastStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleMQ201ToastStart  Auto  

Idle Property OffsetStop  Auto  

Idle Property OffsetCarryMQ201DrinkR  Auto  
