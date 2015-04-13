;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000C6E23 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDWhiterunLoft.value as int)
decoratemarker.enable()
OldMarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property GoldAmount = 400 Auto  

MiscObject Property Gold auto

ObjectReference Property Decoratemarker  Auto  

GlobalVariable Property HDWhiterunLoft  Auto  

ObjectReference Property OldMarker  Auto  
