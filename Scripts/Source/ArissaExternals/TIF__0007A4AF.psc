;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0007A4AF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
QSTGreybeardRumble.Play(akSpeaker)
game.shakeCamera(NONE, 0.1, 1.0)
game.shakeController(0.1, 0.1, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTGreybeardRumble  Auto  
