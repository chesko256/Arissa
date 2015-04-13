;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00024E5E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Set DarkSideContractDialogue.DeekusThreat to 1
;Set DarkSideContractDialogue.DeekusFreaked to 1 
DarkSideContractDialogue DarkSideScript = pSideContractDialogue as DarkSideContractDialogue
DarkSideScript.DeekusThreat = 1
DarkSideScript.DeekusFreaked = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pSideContractDialogue  Auto  
