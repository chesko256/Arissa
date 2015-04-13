;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A8057 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
QF_DA13_0008998D DA13 = getOwningQuest() as QF_DA13_0008998D

(DA13.Alias_Skeever01.getReference()).enable(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

objectReference Property spawnPoint  Auto  

ActorBase Property Skeever  Auto  

bool Property doneRat  Auto  
