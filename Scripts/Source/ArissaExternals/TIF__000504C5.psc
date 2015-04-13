;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000504C5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;InformantLetter.ForceRefTo(Game.GetPlayer().PlaceAtMe( CWMission07InformantLetterSons))
;Game.GetPlayer().AddItem(InformantLetter.GetReference())
GetOwningQuest().setStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property CWMission07InformantLetterSons Auto
ReferenceAlias Property InformantLetter Auto
