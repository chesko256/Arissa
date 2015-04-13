;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__000C1923 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
QF_DA13_0008998D DA13 = getOwningQuest() as QF_DA13_0008998D

(DA13.Alias_Skeever01.getReference()).disable(false)
(DA13.Alias_Skeever02.getReference()).disable(false)
(DA13.Alias_Skeever03.getReference()).disable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if getOwningQuest().getStageDone(40) == FALSE
     getOwningQuest().setStage(40)
endif
getOwningQuest().setStage(45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
