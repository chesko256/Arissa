;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_MQ02_LongExpDone Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if myQuest.GetStage() < 52
myQuest.SetStage(52)
endif

if iNPCSystem.ArissaTalkedAbout_MQ02_Past == false
    iNPCSystem.ArissaTalkedAbout_MQ02_Past = true
    iNPCSystem.IncreaseRegardExtreme()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property myQuest  Auto  

_Arissa_iNPC_Behavior Property iNPCSystem  Auto  
