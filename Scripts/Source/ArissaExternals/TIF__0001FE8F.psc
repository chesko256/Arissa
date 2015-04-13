;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0001FE8F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(SoulGemType, MGR11Amount.GetValueInt())
Game.GetPlayer().AddItem(Gold001, (MGR11Amount.GetValueInt() * MGR11Reward.GetValueInt()))
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
GlobalVariable Property MGR11Amount  Auto  

GlobalVariable Property MGR11Reward  Auto  

MiscObject Property Gold001  Auto  

SoulGem Property SoulGemType  Auto  
