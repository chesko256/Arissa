;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000E24EF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDSolitudeKitchen.value as int)
decoratemarker.enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

int Property GoldAmount  Auto  

ObjectReference Property DecorateMarker  Auto  

GlobalVariable Property HDSolitudeKitchen  Auto  
