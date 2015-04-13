;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000CCD57 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as RelationshipMarriageSpouseHouseScript).MoveSpouse(akspeaker, SolitudeHouse)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SolitudeHouse  Auto  

ReferenceAlias Property WindhelmHouse  Auto  

ReferenceAlias Property MarkarthHouse  Auto  

ReferenceAlias Property RiftenHouse  Auto  

ReferenceAlias Property WhiterunHouse  Auto  
