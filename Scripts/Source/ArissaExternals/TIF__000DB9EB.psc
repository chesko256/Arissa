;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000DB9EB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogueQuest as DialogueWhiterunScript
Script.pSoulGem =1
WhiterunSoulGemQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WhiterunSoulGemQuest  Auto  

Quest Property WhiterunDialogueQuest  Auto  
