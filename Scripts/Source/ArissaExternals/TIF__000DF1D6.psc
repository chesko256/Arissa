;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000DF1D6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; end combat and intimidate
FreeformCidhnaMineA.SetStage(35)
FreeformCidhnaMineA.SetStage(30)
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FreeformMarkarthG  Auto  

Quest Property Favor013  Auto  

Quest Property FreeformCidhnaMineA  Auto  
