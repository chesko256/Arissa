;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0003BCF5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;SetStage DB04a 20
;player.additem DB04aAmulet 1
;player.additem DB04aLetter 1
pDB04a.SetStage (15)
;Game.GetPlayer().AddItem(pAmulet,1)
;Game.GetPlayer().AddItem(pLetter,1)
;pAmaundItemsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB04a  Auto  

MiscObject Property pAmulet  Auto  

Book Property pLetter Auto

Scene Property pAmaundItemsScene  Auto  
