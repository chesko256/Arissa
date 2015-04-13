;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00040398 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; end combat and intimidate
akspeaker.SetRelationshipRank(Game.GetPlayer(), 1)
DialogueDushnikhYal.SetStage(20)
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FreeformMarkarthG  Auto  

Quest Property Favor013  Auto  

Quest Property Favor017  Auto  

MiscObject Property Gold001  Auto  

Quest Property DialogueDushnikhYal  Auto  
