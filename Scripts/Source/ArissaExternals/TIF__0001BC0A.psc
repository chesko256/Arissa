;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0001BC0A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB09Script Script = DB09 as pDB09Script
Script.DeadPoison = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;EmperorAlias.GetActorReference().Kill(Game.GetPlayer())
;EmperorAlias.GetActorReference().PlayAnimation(IdleSoupDeath)
EmperorAlias.GetActorReference().PlayIdle(IdleSoupDeath)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property DB09  Auto  

ReferenceAlias Property EmperorAlias  Auto  

Idle Property IdleSoupDeath  Auto  
