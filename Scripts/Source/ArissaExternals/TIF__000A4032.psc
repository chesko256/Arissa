;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A4032 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DB05Script Script = pDB05 as DB05Script
Script.VeezaraGreet = 1
pVeezara.GetActorRef().StartCombat(pPenitus.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB05  Auto  

ReferenceAlias Property pVeezara  Auto  

ReferenceAlias Property pPenitus  Auto  
