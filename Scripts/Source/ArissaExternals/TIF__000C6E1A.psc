;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000C6E1A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDWhiterunBedroom.value as int)
decoratemarker.enable()
oldmarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DecorateMarker  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property HDWhiterunBedroom  Auto  

ObjectReference Property oldmarker  Auto  
