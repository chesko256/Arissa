;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0005BF29 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB04a.SetStage (20)
;Game.GetPlayer().AddItem(pAmulet,1)
;Game.GetPlayer().AddItem(pLetter,1)
pAmaundGaveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB04a  Auto  

MiscObject Property pAmulet  Auto  

Book Property pLetter  Auto  

Scene Property pAmaundGaveScene  Auto  
