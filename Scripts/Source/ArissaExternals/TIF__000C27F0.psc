;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000C27F0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;this needs to happen immediately, because it's used as condition on invisible continune'd info
(GetOwningQuest() as CWMissionScript).CWs.Intimidate(akSpeaker)
if akSpeaker == InnkeeperA.GetReference()
	GetOwningQuest().setStage(20)
else
	GetOwningQuest().setStage(21)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property InnkeeperA  Auto  

ReferenceAlias Property InnkeeperB  Auto  
