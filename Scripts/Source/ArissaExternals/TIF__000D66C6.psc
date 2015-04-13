;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000D66C6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueFavorGeneric.Bribe(akspeaker)
akspeaker.removeitem(MS01WeylinKey, 1)
Game.GetPlayer().AddItem(MS01WeylinKey, 1)
GetOwningQuest().SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property MS01WeylinKey  Auto  

FavorDialogueScript Property DialogueFavorGeneric  Auto  
