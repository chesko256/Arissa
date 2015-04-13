;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0001A1CF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
HirelingRecognizeBelrand.Value=1
HasHirelingGV.Value=1
(GetOwningQuest() as HirelingQuest).PayHireling(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property HasHirelingGV  Auto  

GlobalVariable Property HirelingRecognizeBelrand  Auto  
