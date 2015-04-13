;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A7B1E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().setstage(10)
Game.AddAchievement(31)
HousecarlWhiterunref.AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property HousecarlWhiterun  Auto  

Faction Property PotentialMarriageFaction  Auto  

ObjectReference Property Lydiaref  Auto  

Actor Property HousecarlWhiterunref  Auto  
