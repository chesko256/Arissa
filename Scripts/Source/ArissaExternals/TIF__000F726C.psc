;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000F726C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDWindhelmKiller.value as int)
decoratemarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DecorateMarker  Auto  

int Property GoldAmount  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property HDWindhelmKiller  Auto  
