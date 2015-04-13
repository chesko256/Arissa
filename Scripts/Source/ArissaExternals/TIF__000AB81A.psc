;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000AB81A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(ReligiousArkayLifeDeath, 1)
akspeaker.AddItem(ReligiousArkayLifeDeath, 1)
Game.GetPlayer().AddItem(FavorRewardGoldLarge)
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property MammothTusk  Auto  

Armor Property ReligiousArkayLifeDeath  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
