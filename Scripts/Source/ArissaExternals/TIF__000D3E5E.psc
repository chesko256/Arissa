;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__000D3E5E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueFavorGeneric.Intimidate(akspeaker)
Game.GetPlayer().AddItem(MS01MargretKey, 1)
GetOwningQuest().SetStage(32)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property MS01MargretKey  Auto  

FavorDialogueScript Property DialogueFavorGeneric  Auto  
