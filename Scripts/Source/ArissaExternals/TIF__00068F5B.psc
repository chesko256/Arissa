;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00068F5B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(FavorRewardWeapon)
Game.GetPlayer().AddItem(FavorRewardArmor)
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

LeveledItem Property FavorRewardPotion  Auto  

LeveledItem Property FavorRewardGold  Auto  

LeveledItem Property FavorRewardWeapon  Auto  

LeveledItem Property FavorRewardArmor  Auto  
