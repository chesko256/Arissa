;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000CA438 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(SKLxBlock2, 1)
akspeaker.AddItem(SKLxBlock2, 1)
Game.GetPlayer().AddItem(FavorRewardGold)
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property MammothTusk  Auto  

Potion Property BlackBriarMead  Auto  

LeveledItem Property FavorRewardArmor  Auto  

Book Property SKLxOneHanded4  Auto  

Book Property SKLxAlchemy3  Auto  

Book Property SKLxBlock2  Auto  

LeveledItem Property FavorRewardGold  Auto  
