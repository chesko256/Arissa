;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002A5E6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(110)
DA06QuestScript DA06Script = DA06 as DA06QuestScript
DA06Script.GroveGhostAppear = -1
DA06ShagrolAlias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DA06ShagrolAlias  Auto  

Quest Property DA06  Auto  
