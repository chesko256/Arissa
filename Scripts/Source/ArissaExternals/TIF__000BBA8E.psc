;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000BBA8E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;add map markers
DushnikhYalMapMarker.AddtoMap()
MorKhazgurMapMarker.AddtoMap()
NarzulburMapMarker.AddtoMap()
LargashburMapMarker.AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property LargashburMapMarker  Auto  

ObjectReference Property DushnikhYalMapMArker  Auto  

ObjectReference Property MorKhazgurMapMarker  Auto  

ObjectReference Property NarzulburMapMarker Auto  
