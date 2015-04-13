;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0005C81F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.additem(Alias_SvenLetter.GetRef())
Game.GetPlayer().AddItem(Alias_FaendalLetter.GetRef())
GetOwningQuest().SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property SvenLetter  Auto  

ReferenceAlias Property Alias_SvenLetter  Auto  

ReferenceAlias Property Alias_FaendalLetter  Auto  
