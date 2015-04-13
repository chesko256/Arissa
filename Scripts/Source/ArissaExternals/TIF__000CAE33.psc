;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000CAE33 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogue as DialogueWhiterunScript
;Game.GetPlayer().AddItem(pJarlSword,1)
WhiterunSwordQuest.SetStage (10)
Script.pSword =1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WhiterunDialogue  Auto  

Quest Property WhiterunSwordQuest  Auto  

Weapon Property pJarlSword  Auto  
