;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00024133 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Set DarkSideContractDialogue.EnnodiusThreat to 1
;Set DarkSideContractDialogue.EnnodiusFreaked to 1 
DarkSideContractDialogue DarkSideScript = pSideContractDialogue as DarkSideContractDialogue
DarkSideScript.EnnodiusThreat = 1
DarkSideScript.EnnodiusFreaked = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pSideContractDialogue  Auto  
