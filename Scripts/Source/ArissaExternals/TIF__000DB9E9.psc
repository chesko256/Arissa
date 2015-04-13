;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000DB9E9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogue as DialogueWhiterunScript
WhiterunBrenuinQuest.SetStage (10)
Script.pBrenuinAle =1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WhiterunBrenuinQuest  Auto  

Quest Property WhiterunDialogue  Auto  
