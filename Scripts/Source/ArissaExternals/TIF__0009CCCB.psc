;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0009CCCB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.pGiveOlavaToken = 1
;Game.GetPlayer().RemoveItem(pToken,1)
DeepwoodRedoubtMarker.AddToMap() 
DeepwoodMarker.Enable()
OlavaReadingQuest.SetStage (200) 
OlavaTreasureQuest.SetStage (10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pToken  Auto  
ObjectReference Property pOlava  Auto  
Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property DeepwoodRedoubtMarker  Auto  

ObjectReference Property DeepwoodMarker  Auto  

Quest Property OlavaReadingQuest  Auto  

Quest Property OlavaTreasureQuest  Auto  
