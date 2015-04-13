;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00087FD6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Debug.MessageBox("Sending event: " + SingleCombatKeyword)
; Debug.Trace("Sending event:" + SingleCombatKeyword)
SingleCombatKeyword.SendStoryEvent(akRef1 = akSpeakerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property SingleCombatKeyword  Auto  
