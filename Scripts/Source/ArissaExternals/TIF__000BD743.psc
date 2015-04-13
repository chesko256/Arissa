;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000BD743 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.GetPlayer().removeItem(cureDisease, 1)
game.GetPlayer().addItem(Gold001, 100)
(vampireVictim.getReference() as actor).removeItem(Gold001, 100)
getOwningQuest().setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Potion Property CureDisease  Auto  

ReferenceAlias Property VampireVictim  Auto  
