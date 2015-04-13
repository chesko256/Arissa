;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000A3E85 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddItem(QuestShield.GetRef())
QuestShield.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Debug.Trace("C00: Starting Aela and Skjor Scene.")
PlayerWatched.ForceRefTo(Game.GetPlayer())
AelaSkjorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property AelaSkjorScene  Auto  

ReferenceAlias Property QuestShield  Auto  

ReferenceAlias Property Shield  Auto  

ReferenceAlias Property PlayerWatched  Auto  
