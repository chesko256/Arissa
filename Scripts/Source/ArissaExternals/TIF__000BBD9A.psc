;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000BBD9A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(200)
(game.getPlayer() as actor).removeItem(Gold001, 750)
(DeepInHisCups.getReference() as actor).addItem(Gold001, 750)

(DeepInHisCups.getReference() as actor).removeItem(ClothesFarmHat03, 1)
(game.getPlayer() as actor).addItem(ClothesFarmHat03, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

referenceAlias Property DeepInHisCups  Auto  

Armor Property ClothesFarmHat03 Auto
