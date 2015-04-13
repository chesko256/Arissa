;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000D3DE0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogue as DialogueWhiterunScript
WhiterunBullyQuest.SetStage (10)
Game.GetPlayer().AddItem(pGold,2)
Script.pKidFight = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pGold  Auto  

Quest Property WhiterunBullyQuest  Auto  

Quest Property WhiterunDialogue  Auto  
