;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000B8C95 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold, 100)
Sentry.GetReference().AddItem(Gold, 100)
GetOwningQuest().Setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

ReferenceAlias Property NorthSentry  Auto  

ReferenceAlias Property SouthSentry  Auto  

ReferenceAlias Property Sentry  Auto  
