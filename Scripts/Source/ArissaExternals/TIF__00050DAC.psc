;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00050DAC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;DarkBrotherhood dbScript = GetOwningQuest() as DarkBrotherhood
;DBScript.pDB01.SetStage (5)

If DB01.GetStage () < 20
    DB01Objective.SetStage (10)  
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB01  Auto  

Quest Property DB01Objective  Auto  
