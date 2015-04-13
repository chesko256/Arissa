;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A8001 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as FavorJobsMineOreScript).SellOre(akspeaker, MinerMoonstone)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property MinerCorundum  Auto  

Keyword Property MinerEbony  Auto  

Keyword Property MinerGold  Auto  

Keyword Property MinerIron  Auto  

Keyword Property MinerMalachite  Auto  

Keyword Property MinerMoonstone  Auto  
